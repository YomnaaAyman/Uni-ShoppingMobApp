import 'package:shopping_app/Models/ProductItemModel.dart';
import 'package:shopping_app/services/firestorer_services.dart';
import 'package:shopping_app/utils/api_paths.dart';

abstract class FavoriteServices {
  Future<void> addFavorite(String userId, ProductItemModel product);
  Future<void> removeFavorite(String userId, String productId);
  Future<List<ProductItemModel>> getFavorites(String userId);
}

class FavoriteServicesImpl implements FavoriteServices {
  final firestoreServices = FirestoreServices.instance;

  @override
  Future<void> addFavorite(String userId, ProductItemModel product) async {
    await firestoreServices.setData(
      path: ApiPaths.favoriteProduct(userId, product.id),
      data: product.toMap(),
    );
  }

  @override
  Future<List<ProductItemModel>> getFavorites(String userId) async {
    final favorites = await firestoreServices.getCollection(
      path: ApiPaths.favoriteProducts(userId),
      builder: (data, documentId) => ProductItemModel.fromMap(data),
    );
    return favorites;
  }

  @override
  Future<void> removeFavorite(String userId, String productId) async {
    await firestoreServices.deleteData(
      path: ApiPaths.favoriteProduct(userId, productId),
    );
  }
}
