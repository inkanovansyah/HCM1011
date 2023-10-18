part of 'auth_bloc.dart';

abstract class AuthBlocEvent extends Equatable {
  const AuthBlocEvent();

  @override
  List<Object> get props => [];
}

//kita mulai dengan parent terlebih dahulu
abstract class AuthEvent {}

//selanjutnya nanti yang akan kita panngil adalah turunan dari parent
class LoginEvent extends AuthEvent {}

//lanjut kita akan buat turunan berikutnya
class LogoutEvent extends AuthEvent {}
