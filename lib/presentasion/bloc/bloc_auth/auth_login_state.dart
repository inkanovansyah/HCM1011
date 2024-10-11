part of 'auth_login_bloc.dart';

class AuthLoginState extends Equatable {
  const AuthLoginState();

  @override
  List<Object> get props => [];
}

class AuthLoginInitial extends AuthLoginState {}

class AuthInProgress extends AuthLoginState {}

class AuthSuccess extends AuthLoginState {
  final String token;

  AuthSuccess({required this.token});

  @override
  List<Object> get props => [token];
}

class AuthFailure extends AuthLoginState {
  final String message;

  AuthFailure({required this.message});

  @override
  List<Object> get props => [message];
}

class AuthLoggedOut extends AuthLoginState {}
