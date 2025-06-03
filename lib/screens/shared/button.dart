import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Text buttonText;
  final Function()? onTap;

  const CustomButton({super.key, required this.buttonText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.teal[600],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: buttonText,
        ),
      ),
    );
  }
}
