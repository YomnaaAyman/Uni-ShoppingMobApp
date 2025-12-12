import 'package:flutter/material.dart';
import 'package:shopping_app/Widgets/CustomeButton.dart';

class VisaDetailsScreen extends StatefulWidget {
  const VisaDetailsScreen({super.key});

  @override
  State<VisaDetailsScreen> createState() => _VisaDetailsScreenState();
}

class _VisaDetailsScreenState extends State<VisaDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expirationDateController =
      TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Visa Payment',
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
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Visa Image
              Center(
                child: Image.network(
                  'https://i.pinimg.com/736x/14/4f/ac/144facc2dc9ebcc2efdaae0b5d098224.jpg',
                  height: screenHeight * 0.25,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              // Title
              Text(
                'Enter Visa Card Details',
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              // Card Number Field
              TextFormField(
                controller: cardNumberController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Card Number',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty || value.length != 16) {
                    return 'Card number must be 16 digits';
                  }
                  return null;
                },
              ),
              SizedBox(height: screenHeight * 0.02),

              // Expiration Date Field
              TextFormField(
                controller: expirationDateController,
                keyboardType: TextInputType.datetime,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Expiration Date (MM/YY)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null ||
                      !RegExp(r'^(0[1-9]|1[0-2])\/\d{2}$').hasMatch(value)) {
                    return 'Enter valid expiration (MM/YY)';
                  }
                  return null;
                },
              ),
              SizedBox(height: screenHeight * 0.02),

              // CVV Field
              TextFormField(
                controller: cvvController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'CVV',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.length != 3) {
                    return 'CVV must be 3 digits';
                  }
                  return null;
                },
              ),
              SizedBox(height: screenHeight * 0.04),

              // Complete Purchase Button
              CustomeButton(
                text: 'Complete Purchase',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Payment logic here
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Visa payment completed successfully!"),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
