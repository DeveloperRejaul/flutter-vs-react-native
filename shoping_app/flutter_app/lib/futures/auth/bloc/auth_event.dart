part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class AuthLoginRequested extends AuthEvent {
  final String email;
  final String password;

  AuthLoginRequested({required this.email, required this.password});
}

class AuthSignUpRequested extends AuthEvent {}

class AuthLogoutRequested extends AuthEvent {}

class AuthLoginCheckRequested extends AuthEvent {
  final String token;
  AuthLoginCheckRequested({required this.token});
}
