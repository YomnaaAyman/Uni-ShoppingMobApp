import 'package:flutter/material.dart';
import 'package:shopping_app/Widgets/CustomeButton.dart';
import 'package:shopping_app/authentication_screens/signup_screen.dart';
import 'package:shopping_app/authentication_screens/login_screen.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8FF),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.network(
                  'https://i.pinimg.com/736x/46/f4/78/46f4787db9555cac9e752cf377bb0a51.jpg',
                  height: 320,
                  fit: BoxFit.contain,
                ),
              ),

              // const Text(
              //   "Shopping is not just about buying things, "
              //   "It's about creating memories!",
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //     fontSize: 15,
              //     fontWeight: FontWeight.w500,
              //     color: Colors.black,
              //     fontFamily: 'Urbanist',
              //   ),
              // ),
              const SizedBox(height: 50),
              CustomeButton(
                text: 'Login',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => loginScreen()),
                  );
                },
              ),
              const SizedBox(height: 20),
              CustomeButton(
                text: 'Sign Up',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => signup_screen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Signup")),
      body: const Center(child: Text("Signup Page")),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: const Center(child: Text("Login Page")),
    );
  }
}
