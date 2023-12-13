part of 'sand_picture_bloc.dart';

abstract class SandPictureState extends Equatable {
  const SandPictureState();

  @override
  List<Object> get props => [];
}

class SandPictureInitial extends SandPictureState {}

class SandPictureloading extends SandPictureState {}

class SandPictureLoaded extends SandPictureState {}

class SandPictureNoData extends SandPictureState {
  final String message;
  const SandPictureNoData(this.message);
  @override
  List<Object> get props => [message];
}

class SandPictureErrorl extends SandPictureState {
  final String message;

  SandPictureErrorl(this.message);
  List<Object> get props => [message];
}
