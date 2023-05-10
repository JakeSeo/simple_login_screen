import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.onClickSuffixIcon,
  });

  final TextEditingController controller;
  final String? hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final VoidCallback? onClickSuffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: Colors.white,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.3),
          ),
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: onClickSuffixIcon,
                icon: suffixIcon!,
              )
            : null,
      ),
    );
  }
}
