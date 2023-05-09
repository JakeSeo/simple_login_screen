import 'package:go_router/go_router.dart';
import 'package:simple_login_screen/router/app_routes.dart';
import '../views/screens.dart';

class AppRouter {
  final router = GoRouter(
    initialLocation: AppRoutes.home.path,
    routes: [
      GoRoute(
          path: AppRoutes.home.path,
          name: AppRoutes.home.name,
          builder: (context, state) => const HomeScreen(),
          routes: [
            GoRoute(
              path: AppRoutes.login.path,
              name: AppRoutes.login.name,
              builder: (context, state) => const LoginScreen(),
            )
          ]),
    ],
  );
}
