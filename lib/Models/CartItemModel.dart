import 'package:shopping_app/Models/ProductItemModel.dart';

class CartItemModel {
  final ProductItemModel product;
  int quantity;

  CartItemModel({required this.product, required this.quantity});

  double get totalPrice => product.price * quantity;

  Map<String, dynamic> toMap() {
    return {'product': product.toMap(), 'quantity': quantity};
  }

  factory CartItemModel.fromMap(Map<String, dynamic> map) {
    return CartItemModel(
      product: ProductItemModel.fromMap(map['product']),
      quantity: map['quantity'],
    );
  }
}
