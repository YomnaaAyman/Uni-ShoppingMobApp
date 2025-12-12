import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // <-- Firestore import
import 'package:shopping_app/Screens/home_screen.dart';
import 'package:shopping_app/Widgets/CustomeButton.dart';
import 'package:shopping_app/Widgets/MyForm.dart';
import 'package:shopping_app/authentication_screens/login_screen.dart';

class signup_screen extends StatelessWidget {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  signup_screen({super.key});

  final _formKey = GlobalKey<FormState>();

  Future<void> signUp(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text,
            );
        String userId = userCredential.user!.uid;

        await userCredential.user?.updateDisplayName(
          fullNameController.text.trim(),
        );

        await FirebaseFirestore.instance
            .collection('Users')
            .doc(userCredential.user!.uid)
            .set({
              'uid': userCredential.user!.uid,
              'fullName': fullNameController.text.trim(),
              'email': emailController.text.trim(),
              'phone': phoneController.text.trim(),
              'createdAt': FieldValue.serverTimestamp(),
            });

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen(userId: userId)),
        );

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Account created successfully')),
        );
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? "An error occurred")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6E6FA),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '       Create Account',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      MyForm(
                        controller: fullNameController,
                        labelText: 'Full Name',
                        textInputType: TextInputType.name,
                        validator: (value) {
                          if (value!.isEmpty) return 'Please enter your name';
                          return null;
                        },
                      ),
                      MyForm(
                        controller: emailController,
                        labelText: 'Email',
                        textInputType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) return 'Please enter your email';
                          return null;
                        },
                      ),
                      MyForm(
                        controller: passwordController,
                        labelText: 'Password',
                        textInputType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value!.isEmpty)
                            return 'Please enter your password';
                          if (value.length < 8)
                            return 'Password must be at least 8 characters';
                          return null;
                        },
                      ),
                      MyForm(
                        controller: rePasswordController,
                        labelText: 'Re-enter Password',
                        textInputType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value!.isEmpty)
                            return 'Please re-enter your password';
                          if (value != passwordController.text)
                            return 'Passwords do not match';
                          return null;
                        },
                      ),
                      MyForm(
                        controller: phoneController,
                        labelText: 'Phone Number',
                        textInputType: TextInputType.phone,
                        validator: (value) {
                          if (value!.isEmpty)
                            return 'Please enter your phone number';
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomeButton(
                        text: 'Sign Up',
                        onPressed: () async {
                          FocusScope.of(context).unfocus();
                          await signUp(context);
                        },
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already Have An Account ?",
                            style: TextStyle(
                              color: Color(0xFF708090),
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => loginScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: Color(0xFFDE3163),
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
