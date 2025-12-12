// class FavouriteManager {
//   static final List<Map<String, dynamic>> _favourites = [];

//   static List<Map<String, dynamic>> get favourites => _favourites;

//   static void addToFavourites(Map<String, dynamic> product) {
//     if (!_favourites.any((item) => item['productName'] == product['productName'])) {
//       _favourites.add(product);
//     }
//   }

//   static void removeFromFavourites(Map<String, dynamic> product) {
//     _favourites.removeWhere((item) => item['productName'] == product['productName']);
//   }

//   static bool isFavourite(Map<String, dynamic> product) {
//     return _favourites.any((item) => item['productName'] == product['productName']);
//   }
// }
// import 'package:shopping_app/Models/ProductItemModel.dart';

// class FavoriteModel {
//   final ProductItemModel product;

//   FavoriteModel({required this.product});

//   Map<String, dynamic> toMap() => {'product': product.toMap()};

//   factory FavoriteModel.fromMap(Map<String, dynamic> map) {
//     return FavoriteModel(product: ProductItemModel.fromMap(map['product']));
//   }
// }

import 'package:shopping_app/Models/ProductItemModel.dart';

class FavouriteItemModel {
  static final List<ProductItemModel> _favourites = [];

  static List<ProductItemModel> get favourites => _favourites;

  static void addToFavourites(ProductItemModel product) {
    if (!_favourites.any((item) => item.name == product.name)) {
      _favourites.add(product);
    }
  }

  static void removeFromFavourites(ProductItemModel product) {
    _favourites.removeWhere((item) => item.name == product.name);
  }

  static bool isFavourite(ProductItemModel product) {
    return _favourites.any((item) => item.name == product.name);
  }
}
