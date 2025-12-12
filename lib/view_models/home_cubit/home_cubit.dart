import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_app/Models/ProductItemModel.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void fetchProducts() async {
    emit(HomeLoading());

    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('Products').get();

      final products =
          snapshot.docs.map((doc) {
            final data = doc.data();
            return ProductItemModel(
              id: doc.id,
              name: data['name'],
              category: data['category'],
              price: (data['price'] as num).toDouble(),
              imgUrl: data['imgUrl'],
            );
          }).toList();

      emit(HomeLoaded(products));
    } catch (e) {
      emit(HomeError('Failed to load products: $e'));
    }
  }
}
