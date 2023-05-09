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
          child: CustomButton(
            onPressed: () => _goToLoginScreen(context),
            child: const Text("로그인"),
          ),
        ),
      ),
    );
  }
}
