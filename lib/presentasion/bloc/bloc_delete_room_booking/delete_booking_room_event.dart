part of 'delete_booking_room_bloc.dart';

abstract class DeleteBookingRoomEvent extends Equatable {
  const DeleteBookingRoomEvent();

  @override
  List<Object> get props => [];
}

class DeleteBookingRoom extends DeleteBookingRoomEvent {
  final String id;
  final String roomid;
  const DeleteBookingRoom({required this.id, required this.roomid});

  @override
  List<Object> get props => [id, roomid];
}
