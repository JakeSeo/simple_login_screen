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
  );

  final String path, completePath, name;
  const AppRoutes(
      {required this.path, required this.completePath, required this.name});
}
