import 'package:flutter/material.dart';
import 'package:simple_login_screen/constants.dart';

import 'router/app_router.dart';

void main() {
  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Simple Login Screen',
      theme: ThemeData(
        primaryColor: Constants.mainColor,
        brightness: Brightness.light,
        fontFamily: 'Pretendard',
      ),
      routerConfig: appRouter.router,
    );
  }
}
