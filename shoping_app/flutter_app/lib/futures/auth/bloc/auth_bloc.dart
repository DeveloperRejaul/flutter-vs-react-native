import 'dart:convert';

import 'package:flutter_app/futures/auth/model/auth_login_model.dart';
import 'package:flutter_app/secrets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>(_authLoginRequested);
    on<AuthLogoutRequested>(_authLogoutRequested);
    on<AuthSignUpRequested>(_authSignUpRequested);
  }

// handle login
  _authLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      var data = {"email": event.email, "password": event.password};
      var url = Uri.parse("$apiUrl/auth/login");

      emit(AuthLoading());
      final res = await http.post(url, body: data);

      if (res.statusCode != 201) {
        return emit(AuthFailure("User name or password incorrect"));
      }
      final decodedData = jsonDecode(res.body);
      final result = AuthLoginModel.fromMap(decodedData);

      emit(
        AuthSuccess(
          refresh_token: result.refresh_token,
          access_token: result.access_token,
        ),
      );
    } catch (e) {
      return emit(AuthFailure(e.toString()));
    }
  }

// handle sing up
  _authSignUpRequested(event, emit) {}

// handle logout
  _authLogoutRequested(event, emit) {}
}
