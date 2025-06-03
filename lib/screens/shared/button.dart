import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color buttonColor;
  final String buttonText;
  final String? iconPath;

  const CustomButton({
    super.key,
    required this.buttonText,
    required this.buttonColor,
    this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    Widget? leadingIcon;

    if (iconPath != null) {
      leadingIcon = Image.asset(
        iconPath!,
        width: 24,
        height: 24,
      );
    }

    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        child: Container(
          padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (leadingIcon != null) ...[
                  leadingIcon,
                  const SizedBox(width: 12),
                ],
                Text(
                  buttonText,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
