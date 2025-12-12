import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_app/Models/ProductItemModel.dart';

class ProductCubit extends Cubit<List<ProductItemModel>> {
  ProductCubit() : super([]);

  Future<void> fetchProducts() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('products').get();
      final products =
          snapshot.docs
              .map(
                (doc) => ProductItemModel.fromMap(
                  doc.data() as Map<String, dynamic>,
                ),
              )
              .toList();
      emit(products);
    } catch (e) {
      // Handle errors
      print("Error fetching products: $e");
      emit([]);
    }
  }
}
