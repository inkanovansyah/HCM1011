import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/room_type..dart';
import 'package:hcm1011/data/service/api_room_type.dart';

part 'room_type_event.dart';
part 'room_type_state.dart';

class RoomTypeBloc extends Bloc<RoomTypeEvent, RoomTypeState> {
  final TypeRoomListapi apiTypeofroom;
  RoomTypeBloc({required this.apiTypeofroom}) : super(RoomTypeInitial()) {
    on<RoomTypeEvent>((event, emit) async {
      try {
        emit(RoomTypeLoading());
        final result = await apiTypeofroom.fetchTypeRoom();
        if (result.data != null && result.status == 200) {
          emit(RoomTypeLoaded(result.data!, result.status ?? 0));
        } else {
          emit(RoomTypeNoData(result.status.toString()));
        }
      } on FailureException catch (e) {
        emit(RoomTypeError(e.message));
      }
    });
  }
}
