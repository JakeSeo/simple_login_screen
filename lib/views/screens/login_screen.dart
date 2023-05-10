import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_login_screen/views/common/custom_button.dart';
import 'package:simple_login_screen/views/common/password_text_form_field.dart';

import '../common/custom_text_form_field.dart';
import '../../utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  _goToSignupScreen(BuildContext context) {}

  _goToForgotPasswordScreen(BuildContext context) {}

  _login() {}

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
                    child: Column(
                      children: [
                        CustomTextFormField(
                          controller: emailController,
                          hintText: '이메일',
                        ),
                        const SizedBox(height: 16),
                        PasswordTextFormField(
                          controller: passwordController,
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
