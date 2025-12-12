import 'package:shopping_app/Models/CartItemModel.dart';
import 'package:shopping_app/Models/ProductItemModel.dart';
import 'package:shopping_app/services/firestorer_services.dart';
import 'package:shopping_app/utils/api_paths.dart';

abstract class ProductDetailsServices {
  Future<ProductItemModel> fetchProductDetails(String productId);
  Future<List<ProductItemModel>> fetchAllProducts();
  Future<void> addToCart(CartItemModel cartItem, String userId);
}

class ProductDetailsServicesImpl implements ProductDetailsServices {
  final firestoreServices = FirestoreServices.instance;

  @override
  Future<ProductItemModel> fetchProductDetails(String productId) async {
    final selectedProduct = await firestoreServices
        .getDocument<ProductItemModel>(
          path: ApiPaths.product(productId),
          builder: (data, documentId) => ProductItemModel.fromMap(data),
        );
    return selectedProduct;
  }

  @override
  Future<List<ProductItemModel>> fetchAllProducts() async {
    final productList = await firestoreServices.getCollection<ProductItemModel>(
      path: 'Products',
      builder: (data, documentId) => ProductItemModel.fromMap(data),
    );
    return productList;
  }

  @override
  Future<void> addToCart(CartItemModel cartItem, String userId) async {
    await firestoreServices.setData(
      path: ApiPaths.cartItem(userId, cartItem.product.id),
      data: cartItem.toMap(),
    );
  }
}
