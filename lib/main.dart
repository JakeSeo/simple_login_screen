import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_login_screen/blocs/auth/auth_bloc.dart';

import './utils.dart';

import 'router/app_router.dart';

void main() {
  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.appRouter,
  });

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: BlocProvider<AuthBloc>(
        create: (_) => AuthBloc(),
        child: MaterialApp.router(
          title: 'Simple Login Screen',
          theme: ThemeData(
            primarySwatch: Utils.mainColor,
            brightness: Brightness.light,
            fontFamily: 'Pretendard',
          ),
          routerConfig: appRouter.router,
        ),
      ),
    );
  }
}
