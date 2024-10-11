import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:hcm1011/data/service/api_apply_room.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/applyRoom.dart';

part 'apply_booking_event.dart';
part 'apply_booking_state.dart';

class ApplyBookingBloc extends Bloc<ApplyBookingEvent, ApplyBookingState> {
  final ApplyRoomApi ApplyRoomapi;

  ApplyBookingBloc({required this.ApplyRoomapi})
      : super(ApplyBookingInitial()) {
    on<ApplyBookingSubmitEvent>((event, emit) async {
      try {
        emit(ApplyBookingLoading());
        final room = event.room;
        final title = event.title;
        final descrip = event.descrip;
        final startdate = event.startdate;
        final enddate = event.enddate;

        final result = await ApplyRoomapi.fatchDataApplyRoom(
            room, title, descrip, startdate, enddate);

        if (result.data != null && result.status == 200) {
          emit(ApplyBookingLoaded(
              result.data, result.messages?.toString(), result.status ?? 0));
        } else {
          emit(ApplyBookingNoData(result.status.toString()));
        }
      } on FailureException catch (e) {
        emit(ApplyBookingError(e.message));
      }
    });
  }
}
