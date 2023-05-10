part of './auth_bloc.dart';

class AuthEvent {}

class Login extends AuthEvent {
  final String email, password;
  Login({required this.email, required this.password});
}

class Logout extends AuthEvent {}
