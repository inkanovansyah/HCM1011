part of 'room_type_bloc.dart';

class RoomTypeState extends Equatable {
  const RoomTypeState();

  @override
  List<Object> get props => [];
}

class RoomTypeInitial extends RoomTypeState {}

class RoomTypeLoading extends RoomTypeState {}

class RoomTypeLoaded extends RoomTypeState {
  final Data? typeofroom;
  final int status;

  RoomTypeLoaded(this.typeofroom, this.status);
  @override
  List<Object> get props => [typeofroom ?? 0, status];
}

class RoomTypeNoData extends RoomTypeState {
  final String message;
  const RoomTypeNoData(this.message);
  @override
  List<Object> get props => [message];
}

class RoomTypeError extends RoomTypeState {
  final String message;
  RoomTypeError(this.message);
  @override
  List<Object> get props => [message];
}
