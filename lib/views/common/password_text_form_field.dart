import 'package:flutter/material.dart';
import 'package:simple_login_screen/views/common/custom_text_form_field.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({
    super.key,
    required this.controller,
    this.onChanged,
  });

  final TextEditingController controller;
  final Function(String)? onChanged;

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

  String? _validatePassword(String? value) {
    RegExp regex = RegExp(
        r'^(?=.*[a-zA-Z].*[a-zA-Z].*[a-zA-Z].*[a-zA-Z].*[a-zA-Z])(?=.*[!@#\$&*~].*[!@#\$&*~])[a-zA-Z!@#\$&*~]{6,}$');
    if (value == null || value.isEmpty) {
      return '비밀번호를 입력해주세요.';
    }
    if (!regex.hasMatch(value)) {
      return '비밀번호는 6자 이상, 영문 5자, 특수문자 2자 이상 포함 되어야 합니다.';
    }
    return null;
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
      validator: _validatePassword,
      onChanged: widget.onChanged,
      textInputAction: TextInputAction.done,
    );
  }
}
