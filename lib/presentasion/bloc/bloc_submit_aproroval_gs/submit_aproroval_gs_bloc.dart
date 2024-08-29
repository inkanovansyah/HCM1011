import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/self_submit_gs.dart';
import 'package:hcm1011/data/service/api_salf_submit_approval_gs.dart';

part 'submit_aproroval_gs_event.dart';
part 'submit_aproroval_gs_state.dart';

class SubmitAprovalGsBloc
    extends Bloc<SubmitAprorovalGsEvent, SubmitAprorovalGsState> {
  final SalfSubmitApprovalGs apiSubmit;

  SubmitAprovalGsBloc({required this.apiSubmit})
      : super(SubmitAprorovalGsInitial()) {
    on<SubmitAprorovalGsEvent>((event, emit) async {
      try {
        emit(SubmitAprorovalGsLoading());
        final result = await apiSubmit.fachdSalfSubmitApproval();
        if (result.data != null && result.status == 200) {
          emit(SubmitAprorovalGsLoaded(result.data!, result.status ?? 0));
        } else {
          emit(SubmitAprorovalGsNoData(result.status.toString()));
        }
      } on FailureException catch (e) {
        emit(SubmitAprorovalGsError(e.message));
      }
    });
  }
}
