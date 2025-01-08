import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:hcm1011/data/model/approval_request.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/service/api_approval_leave.dart';

part 'approval_bos_event.dart';
part 'approval_bos_state.dart';

class ApprovalBosBloc extends Bloc<ApprovalBosEvent, ApprovalBosState> {
  final ApiApprovalLeave apiApprovalLeave;

  ApprovalBosBloc({required this.apiApprovalLeave})
      : super(ApprovalBosInitial()) {
    on<GetApprovalBos>((event, emit) async {
      try {
        emit(ApprovalBosLoading());
        final idLeave = event.idLeave;
        final result = await apiApprovalLeave.fetchDataApproval(idLeave);

        if (result.data != null && result.status == 200) {
          emit(ApprovalBosLoaded(result.data!, result.status ?? 0));
        } else {
          emit(ApprovalBosError(result.status.toString()));
        }
      } on FailureException catch (e) {
        emit(ApprovalBosError(e.message));
      }
    });
  }
}
