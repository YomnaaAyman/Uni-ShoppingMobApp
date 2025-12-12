import 'package:shopping_app/Models/CartItemModel.dart';

class CartService {
  final List<CartItemModel> _cartItems = [];

  Future<List<CartItemModel>> fetchCartItems() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return List<CartItemModel>.from(_cartItems);
  }

  Future<void> addToCart(CartItemModel item) async {
    await Future.delayed(const Duration(milliseconds: 200));
    _cartItems.add(item);
  }

  Future<void> removeFromCart(CartItemModel item) async {
    await Future.delayed(const Duration(milliseconds: 200));
    _cartItems.remove(item);
  }

  Future<void> clearCart() async {
    await Future.delayed(const Duration(milliseconds: 200));
    _cartItems.clear();
  }
}
