enum AppRoutes {
  home(
    path: '/',
    completePath: '/',
    name: 'home',
  ),
  login(
    path: 'login',
    completePath: '/login',
    name: 'login',
  ),
  forgotPassword(
    path: 'forgot-password',
    completePath: '/login/forgot-password',
    name: 'forgotPassword',
  ),
  signup(
    path: 'signup',
    completePath: '/login/signup',
    name: 'signup',
  );

  final String path, completePath, name;
  const AppRoutes(
      {required this.path, required this.completePath, required this.name});
}
