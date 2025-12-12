import 'package:flutter/material.dart';
import 'package:shopping_app/Screens/home_screen.dart';

class ThankYouScreen extends StatelessWidget {
  final String userId;
  const ThankYouScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFE6E6FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(userId: userId),
              ),
            );
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.07),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon Image
              Image.network(
                'https://i.pinimg.com/736x/46/f4/78/46f4787db9555cac9e752cf377bb0a51.jpg',
                height: screenHeight * 0.50,
              ),
              SizedBox(height: screenHeight * 0.04),

              Text(
                "Thank You ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Urbanist',
                ),
              ),
              Text(
                "For Shopping With Us ! ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Urbanist',
                ),
              ),
              SizedBox(height: screenHeight * 0.025),
              Text(
                "Your order has been successfully placed.\n"
                "We hope you enjoy your purchase and come back soon!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                  fontFamily: 'Urbanist',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
