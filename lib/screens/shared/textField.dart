import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final labelText;
  final textController;
  final String hintText;
  final bool obscureText;

  const CustomTextField({
    super.key,
    required this.labelText,
    required this.textController,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(labelText),

          const SizedBox(height: 5),

          TextField(
            controller: textController,
            obscureText: obscureText,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              filled: true,
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
