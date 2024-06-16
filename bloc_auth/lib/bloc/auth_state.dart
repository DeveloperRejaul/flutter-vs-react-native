part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

// initial auth state
final class AuthInitial extends AuthState {}

// single state in hare
final class AuthSuccess extends AuthState {
  final String id;
  final String message = "You are successfully login";
  AuthSuccess(this.id);
}

// single state in hare
final class AuthFailure extends AuthState {
  final String error;
  AuthFailure(this.error);
}

// single state in hare
final class AuthLoading extends AuthState {}
