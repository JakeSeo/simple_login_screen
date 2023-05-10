import 'package:flutter/material.dart';
import 'package:simple_login_screen/views/common/custom_text_form_field.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool hidePassword = true;

  _onTogglePassword() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.controller,
      hintText: '패스워드',
      obscureText: hidePassword,
      suffixIcon: Icon(
        hidePassword ? Icons.tag_faces : Icons.tag_faces_rounded,
      ),
      onClickSuffixIcon: _onTogglePassword,
    );
  }
}
