import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_login_screen/router/app_routes.dart';

import '../common/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  _goToLoginScreen(BuildContext context) {
    context.goNamed(AppRoutes.login.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "홈 화면",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 16),
              CustomButton(
                onPressed: () => _goToLoginScreen(context),
                text: "로그인",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
