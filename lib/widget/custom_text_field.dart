import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData prefixIcon;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.prefixIcon,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.white,

        // Border when the field is focused
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Color(0xFFFFC300), // Custom focus color (yellow)
            width: 2, // Border width when focused
          ),
        ),

        // Border when the field is not focused
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Color(0xFFE0E0E0), // Light border color (grey)
            width: 1.5, // Border width when not focused
          ),
        ),

        // Error border (if validation fails)
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.red, // Red border on error
            width: 1.5,
          ),
        ),

        // Focused error border
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.red, // Red border on focused error
            width: 2,
          ),
        ),
      ),
    );
  }
}