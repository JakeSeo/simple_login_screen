import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_login_screen/views/common/custom_button.dart';
import 'package:simple_login_screen/views/common/password_text_form_field.dart';

import '../../router/app_routes.dart';
import '../common/custom_text_form_field.dart';
import '../../utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _formIsValid = false;
  _goToSignupScreen(BuildContext context) {
    context.goNamed(AppRoutes.signup.name);
  }

  _goToForgotPasswordScreen(BuildContext context) {
    context.goNamed(AppRoutes.forgotPassword.name);
  }

  _login() {
    // TODO: 상태관리
  }

  void _onEditText(String value) {
    if (_formKey.currentState == null) return;

    setState(() {
      _formIsValid = _formKey.currentState!.validate();
    });
  }

  String? _validateEmail(String? value) {
    RegExp regex = RegExp(
        r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$");
    if (value == null || value.isEmpty) {
      return '이메일을 입력해주세요.';
    }
    if (!regex.hasMatch(value)) {
      return '이메일을 확인해주세요.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 36,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          "로그인",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            context.pop();
          },
          child: const Icon(
            Icons.arrow_left_rounded,
            size: 50,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => _goToSignupScreen(context),
            child: const Center(
              child: Text(
                "회원가입",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(height: 24),
                  Row(
                    children: const [
                      Text(
                        "로그인 하세요.",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          controller: emailController,
                          hintText: '이메일',
                          validator: _validateEmail,
                          onChanged: _onEditText,
                        ),
                        const SizedBox(height: 16),
                        PasswordTextFormField(
                          controller: passwordController,
                          onChanged: _onEditText,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              enabled: _formIsValid,
              onPressed: _login,
              text: "로그인",
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () => _goToForgotPasswordScreen(context),
              child: const Text(
                "비밀번호 찾기",
                style: TextStyle(
                  color: Utils.mainGreen,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
