import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final labelText;
  final textController;
  final String hintText;
  final bool obscureText;
  final VoidCallback? onTap;

  const CustomTextField({
    super.key,
    required this.labelText,
    required this.textController,
    required this.hintText,
    required this.obscureText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(labelText),

          const SizedBox(height: 10),

          TextField(
            controller: textController,
            obscureText: obscureText,
            readOnly: onTap != null,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).colorScheme.onPrimary),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).colorScheme.onPrimaryContainer),
                borderRadius: BorderRadius.circular(8),
              ),
              filled: true,
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 14),
            ),
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
