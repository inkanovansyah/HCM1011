import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:hcm1011/data/service/api_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_login_event.dart';
part 'auth_login_state.dart';

class AuthLoginBloc extends Bloc<AuthLoginEvent, AuthLoginState> {
  final Auth auth; // Instance of your Auth class for API calls

  AuthLoginBloc(this.auth) : super(AuthLoginInitial()) {
    on<AuthLoginRequested>(_onAuthLoginRequested);
  }

  Future<void> _onAuthLoginRequested(
      AuthLoginRequested event, Emitter<AuthLoginState> emit) async {
    try {
      emit(AuthInProgress());
      // Call the API for login
      await auth.authLoginApi(event.email, event.password);
      // Fetch the token from SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token') ?? '';
      if (token.isNotEmpty) {
        emit(AuthSuccess(token: token));
      } else {
        emit(AuthFailure(message: 'Login failed. Token is missing.'));
      }
    } catch (e) {
      emit(AuthFailure(message: 'An unknown error occurred: $e'));
    }
  }
}
