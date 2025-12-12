import 'package:flutter/material.dart';

class CustomeButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomeButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.pink.shade300, // Dark blue
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white, // Button text in white
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
