import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/authentication_screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    testFirebaseConnection();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => WelcomePage()),
      );
    });
  }

  void testFirebaseConnection() async {
    try {
      await FirebaseFirestore.instance
          .collection('test')
          .doc('connection_check')
          .set({'connected': true});
      debugPrint('✅ Connected to Firebase Firestore!');
    } catch (e) {
      debugPrint('❌ Firebase connection error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 62, 141),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color.fromARGB(
                      255,
                      233,
                      173,
                      197,
                    ), // Faint circle behind logo
                  ),
                ),
                Image.network(
                  "https://i.pinimg.com/736x/86/64/d8/8664d8bcd4d8e543199a4aa1425eb391.jpg",
                  width: 100,
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Veloura",
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Find Your Perfect Style !",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
