import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:hcm1011/data/service/api_apply_leave.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/applyLeave.dart';

part 'apply_leave_event.dart';
part 'apply_leave_state.dart';

class ApplyLeaveBloc extends Bloc<ApplyLeaveEvent, ApplyLeaveState> {
  final ApplyLeave ApplyLeaveapi;

  ApplyLeaveBloc({
    required this.ApplyLeaveapi,
  }) : super(ApplyLeaveInitial()) {
    on<ApplyLeaveSubmitEvent>((event, emit) async {
      try {
        emit(ApplyLeaveLoading());
        final descrip = event.descrip;
        final startdate = event.startdate;
        final enddate = event.enddate;
        final leavetype = event.leaveType;

        final result = await ApplyLeaveapi.fatchDataApplyLeave(
            descrip, startdate, enddate, leavetype);
        if (result.data != null && result.status == 200) {
          emit(ApplyLeaveLoaded(result.data!, result.status ?? 0));
        } else {
          emit(ApplyLeaveNoData(result.status.toString()));
        }
      } on FailureException catch (e) {
        emit(ApplyLeaveError(e.message));
      }
    });
  }
}
