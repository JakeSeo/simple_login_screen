import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_login_screen/router/app_routes.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../common/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  _goToLoginScreen(BuildContext context) {
    context.goNamed(AppRoutes.login.name);
  }

  _logout(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(Logout());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("홈 화면")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              var buttonText = "로그인";
              var onPressed = () => _goToLoginScreen(context);
              if (state is LoggedIn) {
                buttonText = "로그아웃";
                onPressed = () => _logout(context);
              }

              return CustomButton(
                onPressed: onPressed,
                text: buttonText,
                isLoading: state is Loading,
                enabled: state is! Loading,
              );
            },
          ),
        ),
      ),
    );
  }
}
