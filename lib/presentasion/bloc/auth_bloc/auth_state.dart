part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

//selanjutnya kita buat class turunan dari AuthState{} biasanya
class AuthInitial extends AuthState {}

// nanti kita juga butuh loading ketika sudah berhasil masuk login maka laoding
// setiap perubahan maka masuk state
class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthError extends AuthState {}
