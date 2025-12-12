import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/Models/CartItemModel.dart';

class CartCubit extends Cubit<List<CartItemModel>> {
  CartCubit() : super([]);

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void addToCart(CartItemModel cartItem) async {
    final updatedCart = List<CartItemModel>.from(state);
    updatedCart.add(cartItem);
    emit(updatedCart);
    await _firestore.collection('orders').add({
      'productId': cartItem.product.id,
      'productName': cartItem.product.name,
      'productCategory': cartItem.product.category,
      'productPrice': cartItem.product.price,
      'quantity': cartItem.quantity,
      'totalPrice': cartItem.totalPrice,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  void removeFromCart(CartItemModel cartItem) {
    final updatedCart = List<CartItemModel>.from(state);
    updatedCart.remove(cartItem);
    emit(updatedCart);
  }

  void clearCart() {
    emit([]);
  }
}
