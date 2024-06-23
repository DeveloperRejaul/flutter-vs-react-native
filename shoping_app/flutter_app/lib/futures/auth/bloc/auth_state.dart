part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthFailure extends AuthState {
  final String message;
  AuthFailure(this.message);
}

final class AuthLoading extends AuthState {}

// auth login
final class AuthSuccess extends AuthState {
  final String access_token;
  final String refresh_token;
  AuthSuccess({
    required this.access_token,
    required this.refresh_token,
  });
}

// auth login check
final class AuthCheckSuccess extends AuthState {}

final class AuthCheckFailure extends AuthState {
  final String message;
  AuthCheckFailure(this.message);
}

final class AuthCheckLoading extends AuthState {}
