import 'package:flutter/material.dart';
import 'package:shopping_app/Screens/visaCardDetails.dart';
import 'package:shopping_app/Widgets/CustomeButton.dart';
import 'package:shopping_app/Widgets/MyForm.dart';
import 'package:shopping_app/authentication_screens/ThankyouScreen.dart';

class CheckoutScreen extends StatefulWidget {
  final String userId;
  const CheckoutScreen({super.key, required this.userId});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String selectedPaymentMethod = '';

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: TextStyle(color: Colors.black, fontSize: screenWidth * 0.05),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFF8F8FF),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenHeight * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                'https://i.pinimg.com/736x/21/28/71/212871b3e0c37a36aec8c60efdd578ff.jpg',
                height: screenHeight * 0.45,
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Text(
              'Shipping Information',
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Container(
              padding: EdgeInsets.all(screenWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyForm(
                    controller: nameController,
                    labelText: 'Full Name',
                    textInputType: TextInputType.name,
                  ),
                  MyForm(
                    controller: emailController,
                    labelText: 'Email Address',
                    textInputType: TextInputType.emailAddress,
                  ),
                  MyForm(
                    controller: addressController,
                    labelText: 'Shipping Address',
                    textInputType: TextInputType.streetAddress,
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.04),
            Text(
              'Select Payment Method',
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedPaymentMethod = 'Cash';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          selectedPaymentMethod == 'Cash'
                              ? Color(0xFFccd1d1)
                              : Colors.white,
                    ),
                    child: Text('Cash'),
                  ),
                ),
                SizedBox(width: screenWidth * 0.02),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedPaymentMethod = 'Visa';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          selectedPaymentMethod == 'Visa'
                              ? Color(0xFFccd1d1)
                              : Colors.white,
                    ),
                    child: Text('Visa'),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.04),
            CustomeButton(
              text: 'Complete Purchase',
              onPressed: () {
                if (selectedPaymentMethod == 'Cash') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => ThankYouScreen(userId: widget.userId),
                    ),
                  );
                } else if (selectedPaymentMethod == 'Visa') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VisaDetailsScreen(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please select a payment method."),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
