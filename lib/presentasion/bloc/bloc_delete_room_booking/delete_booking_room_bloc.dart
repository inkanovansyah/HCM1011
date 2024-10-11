import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/model_delete_br.dart';
import 'package:hcm1011/data/service/api_delete_booking_room.dart';

part 'delete_booking_room_event.dart';
part 'delete_booking_room_state.dart';

class DeleteBookingRoomBloc
    extends Bloc<DeleteBookingRoomEvent, DeleteBookingRoomState> {
  final ApiDeleteBookingRoom dalateGs;

  DeleteBookingRoomBloc({required this.dalateGs})
      : super(DeleteBookingRoomInitial()) {
    on<DeleteBookingRoom>((event, emit) async {
      try {
        emit(DeleteBookingRoomLoading());
        final id = event.id;
        final roomid = event.roomid;
        final result = await dalateGs.deleteBookingRoom(id, roomid);
        if (result.data != null && result.status == 200) {
          emit(DeleteBookingRoomLoaded(
            applyDeleteRoom: result.data,
            status: result.status ?? 0,
          ));
        } else {
          emit(DeleteBookingRoomNodata(message: result.messages));
        }
      } on FailureException catch (e) {
        emit(DeleteBookingRoomNodata(message: e.message));
      }
    });
  }
}
