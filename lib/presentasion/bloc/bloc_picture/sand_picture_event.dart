part of 'sand_picture_bloc.dart';

abstract class SandPictureEvent extends Equatable {
  const SandPictureEvent();

  @override
  List<Object> get props => [];
}

class LoginButtonPressed extends SandPictureEvent {
  final String userfile;

  const LoginButtonPressed({required this.userfile});

  @override
  List<Object> get props => [userfile];

  @override
  String toString() => 'LoginButtonPressed { file: $userfile}';
}
