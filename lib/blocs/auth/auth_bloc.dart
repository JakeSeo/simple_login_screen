import 'package:flutter_bloc/flutter_bloc.dart';

part './auth_event.dart';
part './auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(LoggedOut()) {
    on<Login>(onLogin);
    on<Logout>(onLogout);
  }

  onLogin(Login event, Emitter<AuthState> emit) async {
    emit(Loading());
    await Future.delayed(const Duration(milliseconds: 1500));
    emit(LoggedIn());
  }

  onLogout(Logout event, Emitter<AuthState> emit) async {
    emit(Loading());
    await Future.delayed(const Duration(milliseconds: 1500));
    emit(LoggedOut());
  }
}
