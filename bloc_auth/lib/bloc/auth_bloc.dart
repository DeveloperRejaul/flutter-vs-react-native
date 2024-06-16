import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>(_authLoginRequested);
    on<AuthLogOutRequested>(_authLogOutRequested);
  }

  void _authLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    // start loading
    emit(AuthLoading());

    try {
      // check valid input
      final email = event.email;
      final password = event.password;

      // checking password valid
      if (password.length < 6) {
        return emit(AuthFailure("Password must be at least 6 characters"));
      }

      // checking email valid
      if (email == "") {
        return emit(AuthFailure("Email is required"));
      }

      // emit success message
      await Future.delayed(const Duration(seconds: 2), () {
        emit(AuthSuccess("$email - $password`"));
      });
    } catch (e) {
      return emit(AuthFailure(e.toString()));
    }
  }

  void _authLogOutRequested(
    AuthLogOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      await Future.delayed(const Duration(seconds: 2), () {
        return emit(AuthInitial());
      });
    } catch (e) {
      return emit(AuthFailure(e.toString()));
    }
  }
}
