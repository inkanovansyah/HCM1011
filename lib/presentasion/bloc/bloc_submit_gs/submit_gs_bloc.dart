import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/submit_goal_setting.dart';
import 'package:hcm1011/data/service/api_submit.dart';

part 'submit_gs_event.dart';
part 'submit_gs_state.dart';

class SubmitGsBloc extends Bloc<SubmitGsEvent, SubmitGsState> {
  final SubmitGs apiSubmit;

  SubmitGsBloc({required this.apiSubmit}) : super(SubmitGsInitial()) {
    on<SubmitGsEvent>((event, emit) async {
      // TODO: implement event handler
      try {
        emit(SubmitGsLoading());

        final result = await apiSubmit.fachSubmitdataGs();
        if (result.data != null && result.status == 200) {
          emit(SubmitGsLoaded(result.data!, result.status ?? 0));
        } else {
          emit(SubmitGsNoData(result.status.toString()));
        }
      } on FailureException catch (e) {
        emit(SubmitGsError(e.message));
      }
    });
  }
}
