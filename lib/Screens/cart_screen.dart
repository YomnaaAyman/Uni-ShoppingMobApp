import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/Models/CartItemModel.dart';
import 'package:shopping_app/Screens/checkout_screen.dart';
import 'package:shopping_app/Widgets/CustomeButton.dart';

import 'package:shopping_app/view_models/cart_cubit/cart_cubit.dart';

class CartScreen extends StatelessWidget {
  final String userId;
  const CartScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider<CartCubit>(
      create: (_) => CartCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Shopping Cart",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.pink.shade300,
        ),
        body: BlocBuilder<CartCubit, List<CartItemModel>>(
          builder: (context, cartItems) {
            double totalAmount = cartItems.fold(
              0,
              (sum, item) => sum + item.totalPrice,
            );

            return Column(
              children: [
                Expanded(
                  child:
                      cartItems.isEmpty
                          ? const Center(child: Text("Your cart is empty"))
                          : ListView.builder(
                            itemCount: cartItems.length,
                            itemBuilder: (context, index) {
                              final cartItem = cartItems[index];
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.04,
                                  vertical: screenHeight * 0.01,
                                ),
                                child: ListTile(
                                  contentPadding: EdgeInsets.all(
                                    screenWidth * 0.02,
                                  ),
                                  leading: Image.asset(
                                    cartItem.product.imgUrl,
                                    width: screenWidth * 0.15,
                                    height: screenWidth * 0.15,
                                    fit: BoxFit.cover,
                                  ),
                                  title: Text(
                                    cartItem.product.name,
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.045,
                                    ),
                                  ),
                                  subtitle: Text(
                                    "Qty: ${cartItem.quantity} - ${cartItem.product.category}",
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.035,
                                    ),
                                  ),
                                  trailing: Text(
                                    "\$${cartItem.totalPrice.toStringAsFixed(2)}",
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.045,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                ),
                Padding(
                  padding: EdgeInsets.all(screenWidth * 0.05),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300, width: 1),
                    ),
                    padding: EdgeInsets.all(screenWidth * 0.05),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total",
                              style: TextStyle(
                                fontSize: screenWidth * 0.05,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "\$${totalAmount.toStringAsFixed(2)}",
                              style: TextStyle(
                                fontSize: screenWidth * 0.05,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        CustomeButton(
                          text: "Proceed to Checkout",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => CheckoutScreen(userId: userId),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
