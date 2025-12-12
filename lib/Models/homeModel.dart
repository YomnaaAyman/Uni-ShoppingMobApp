import 'ProductItemModel.dart';

class HomeModel {
  final List<HomeModel> carouselItems;
  final List<ProductItemModel> featuredProducts;
  final List<ProductItemModel> newArrivals;

  HomeModel({
    required this.carouselItems,
    required this.featuredProducts,
    required this.newArrivals,
  });

  Map<String, dynamic> toMap() {
    return {
      'carouselItems': carouselItems.map((e) => e.toMap()).toList(),
      'featuredProducts': featuredProducts.map((e) => e.toMap()).toList(),
      'newArrivals': newArrivals.map((e) => e.toMap()).toList(),
    };
  }

  factory HomeModel.fromMap(Map<String, dynamic> map) {
    return HomeModel(
      carouselItems: List<HomeModel>.from(
        (map['carouselItems'] ?? []).map((x) => HomeModel.fromMap(x)),
      ),
      featuredProducts: List<ProductItemModel>.from(
        (map['featuredProducts'] ?? []).map((x) => ProductItemModel.fromMap(x)),
      ),
      newArrivals: List<ProductItemModel>.from(
        (map['newArrivals'] ?? []).map((x) => ProductItemModel.fromMap(x)),
      ),
    );
  }
}
