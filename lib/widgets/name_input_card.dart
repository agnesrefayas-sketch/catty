
import 'package:flutter/material.dart';

class NameInputCard extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const NameInputCard({
    super.key,
    required this.controller,
    this.validator,
  });

  static const Color primaryColor = Color(0xFFFF8FA3);
  static const Color textColor = Color(0xFF493D46);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      textCapitalization: TextCapitalization.words,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        hintText: 'Enter your name',
        prefixIcon: const Icon(
          Icons.person_outline_rounded,
          color: primaryColor,
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 17,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(
            color: Color(0xFFF0E5E8),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(
            color: Color(0xFFF0E5E8),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(
            color: primaryColor,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(
            color: Colors.redAccent,
          ),
        ),
      ),
      style: const TextStyle(
        color: textColor,
        fontSize: 15,
      ),
    );
  }
}
