import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:hcm1011/data/model/leave.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/service/api_leave_list.dart';

part 'leave_event.dart';
part 'leave_state.dart';

class LeaveBloc extends Bloc<LeaveEvent, LeaveState> {
  final ListLeave apiListLeave;

  LeaveBloc({
    required this.apiListLeave,
  }) : super(LeaveInitial()) {
    on<LeaveEvent>(
      (event, emit) async {
        try {
          emit(
            LeaveLoading(),
          );
          final result = await apiListLeave.fatchDataLeave();
          if (result.status == 200) {
            emit(
              LeaveLoaded(result.data, result.status),
            );
          } else {
            emit(
              LeaveNoData(result.status.toString()),
            );
          }
        } on FailureException catch (e) {
          emit(
            LeaveError(e.message),
          );
        }
      },
    );
  }
}
