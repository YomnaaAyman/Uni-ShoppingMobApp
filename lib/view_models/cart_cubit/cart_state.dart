import 'package:equatable/equatable.dart';
import 'package:shopping_app/Models/CartItemModel.dart';

class CartState extends Equatable {
  final List<CartItemModel> cartItems;

  const CartState({this.cartItems = const []});

  CartState copyWith({List<CartItemModel>? cartItems}) {
    return CartState(cartItems: cartItems ?? this.cartItems);
  }

  @override
  List<Object?> get props => [cartItems];
}
