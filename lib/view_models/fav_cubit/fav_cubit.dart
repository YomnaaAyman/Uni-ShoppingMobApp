import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/services/auth_services.dart';
import 'package:shopping_app/services/favourite_services.dart';
import 'package:shopping_app/view_models/fav_cubit/fav_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  final favoriteServices = FavoriteServicesImpl();
  final authServices = AuthServices();

  Future<void> getFavoriteProducts() async {
    emit(FavoriteLoading());
    try {
      final currentUser = authServices.getCurrentUser();
      final favoriteProducts = await favoriteServices.getFavorites(
        currentUser!.uid,
      );
      emit(FavoriteLoaded(favoriteProducts));
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }

  Future<void> removeFavorite(String productId) async {
    emit(FavoriteRemoving(productId));
    try {
      final currentUser = authServices.getCurrentUser();
      await favoriteServices.removeFavorite(currentUser!.uid, productId);
      emit(FavoriteRemoved(productId));

      final favoriteProducts = await favoriteServices.getFavorites(
        currentUser.uid,
      );
      emit(FavoriteLoaded(favoriteProducts));
    } catch (e) {
      emit(FavoriteRemoveError(e.toString()));
    }
  }
}
