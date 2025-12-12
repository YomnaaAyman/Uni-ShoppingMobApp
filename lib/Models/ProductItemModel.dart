enum ProductSize { S, M, L, XL }

extension ProductSizeExtension on ProductSize {
  static ProductSize fromString(String size) {
    switch (size.toUpperCase()) {
      case 'S':
        return ProductSize.S;
      case 'M':
        return ProductSize.M;
      case 'L':
        return ProductSize.L;
      case 'XL':
        return ProductSize.XL;
      default:
        return ProductSize.S;
    }
  }

  String get stringValue => name;
}

class ProductItemModel {
  final String id;
  final String name;
  final String imgUrl;
  final double price;
  final String category;
  final List<ProductSize> availableSizes;
  final int stockQuantity;

  ProductItemModel({
    required this.id,
    required this.imgUrl,
    required this.name,
    required this.price,
    required this.category,
    this.availableSizes = const [
      ProductSize.S,
      ProductSize.M,
      ProductSize.L,
      ProductSize.XL,
    ],
    this.stockQuantity = 10,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imgUrl': imgUrl,
      'name': name,
      'price': price,
      'category': category,
      'sizes': availableSizes.map((e) => e.stringValue).toList(),
      'quantity': stockQuantity,
    };
  }

  factory ProductItemModel.fromMap(Map<String, dynamic> map) {
    return ProductItemModel(
      id: map['id'] ?? '',
      imgUrl: map['imgUrl'] ?? '',
      name: map['name'] ?? '',
      price: (map['price'] as num?)?.toDouble() ?? 0.0,
      category: map['category'] ?? '',
      availableSizes:
          (map['sizes'] as List<dynamic>? ?? [])
              .map((size) => ProductSizeExtension.fromString(size.toString()))
              .toList(),
      stockQuantity: (map['quantity'] as num?)?.toInt() ?? 10,
    );
  }

  ProductItemModel copyWith({
    String? id,
    String? imgUrl,
    String? name,
    double? price,
    String? category,
    List<ProductSize>? availableSizes,
    int? stockQuantity,
  }) {
    return ProductItemModel(
      id: id ?? this.id,
      imgUrl: imgUrl ?? this.imgUrl,
      name: name ?? this.name,
      price: price ?? this.price,
      category: category ?? this.category,
      availableSizes: availableSizes ?? this.availableSizes,
      stockQuantity: stockQuantity ?? this.stockQuantity,
    );
  }
}
