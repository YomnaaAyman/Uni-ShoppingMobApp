import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/Models/CartItemModel.dart';
import 'package:shopping_app/Models/ProductItemModel.dart';
import 'package:shopping_app/Widgets/CustomeButton.dart';
import 'package:shopping_app/services/favourite_services.dart';
import 'package:shopping_app/view_models/cart_cubit/cart_cubit.dart';

class ProductDetails extends StatefulWidget {
  final String productId;
  final String imageUrl;
  final String productName;
  final String productCategory;
  final double productPrice;
  final String userId;

  const ProductDetails({
    super.key,
    required this.productId,
    required this.imageUrl,
    required this.productName,
    required this.productCategory,
    required this.productPrice,
    required this.userId,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int quantity = 1;
  String selectedSize = 'M';
  bool isFavorite = false;

  final List<String> sizes = ['S', 'M', 'L', 'XL'];
  final FavoriteServices _favoriteServices = FavoriteServicesImpl();

  @override
  void initState() {
    super.initState();
  }

  void toggleFavourite() async {
    final product = ProductItemModel(
      id: widget.productId,
      imgUrl: widget.imageUrl,
      name: widget.productName,
      category: widget.productCategory,
      price: widget.productPrice,
    );

    setState(() {
      isFavorite = !isFavorite;
    });

    if (isFavorite) {
      await _favoriteServices.addFavorite(widget.userId, product);
    } else {
      await _favoriteServices.removeFavorite(widget.userId, widget.productId);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8FF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.black,
            ),
            onPressed: toggleFavourite,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                widget.imageUrl,
                height: screenHeight * 0.25,
                fit: BoxFit.contain,
                errorBuilder:
                    (context, error, stackTrace) =>
                        const Icon(Icons.broken_image),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),

            Text(
              widget.productName,
              style: TextStyle(
                fontSize: screenWidth * 0.055,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.productCategory,
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              '\$${widget.productPrice.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: screenHeight * 0.03),

            const Text(
              "Select Size",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: screenHeight * 0.01),
            Row(
              children:
                  sizes.map((size) {
                    final isSelected = size == selectedSize;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedSize = size;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: screenWidth * 0.03),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.black : Colors.white,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          size,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
            ),

            SizedBox(height: screenHeight * 0.03),

            const Text(
              "Quantity",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: screenHeight * 0.01),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    if (quantity > 1) {
                      setState(() {
                        quantity--;
                      });
                    }
                  },
                ),
                Text(quantity.toString(), style: const TextStyle(fontSize: 18)),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                ),
              ],
            ),

            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: screenHeight * 0.07,
              child: CustomeButton(
                text: "Add to Cart",
                onPressed: () {
                  final cartItem = CartItemModel(
                    product: ProductItemModel(
                      id: widget.productId,
                      imgUrl: widget.imageUrl,
                      name: widget.productName,
                      category: widget.productCategory,
                      price: widget.productPrice,
                    ),
                    quantity: quantity,
                  );
                  context.read<CartCubit>().addToCart(cartItem);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
