import 'package:flutter/material.dart';

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
      theme: ThemeData(),
      routerConfig: appRouter.router,
    );
  }
}
