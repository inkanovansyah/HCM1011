part of 'delete_booking_room_bloc.dart';

abstract class DeleteBookingRoomState extends Equatable {
  const DeleteBookingRoomState();

  @override
  List<Object> get props => [];
}

class DeleteBookingRoomInitial extends DeleteBookingRoomState {}

class DeleteBookingRoomLoading extends DeleteBookingRoomState {}

class DeleteBookingRoomLoaded extends DeleteBookingRoomState {
  final List<dynamic>? applyDeleteRoom;
  final int? status;

  DeleteBookingRoomLoaded({this.applyDeleteRoom, this.status});
  @override
  List<Object> get props => [applyDeleteRoom ?? [], status ?? []];
}

class DeleteBookingRoomNodata extends DeleteBookingRoomState {
  final String? message;
  DeleteBookingRoomNodata({this.message});
  @override
  List<Object> get props => [message ?? ''];
}

class DeleteBookingRoomError extends DeleteBookingRoomState {
  final String? message;
  DeleteBookingRoomError({this.message});
  @override
  List<Object> get props => [message ?? ''];
}
