import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:hcm1011/data/model/job_history.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/service/api_job_history.dart';

part 'job_history_event.dart';
part 'job_history_state.dart';

class JobHistoryBloc extends Bloc<JobHistoryEvent, JobHistoryState> {
  final Jobhistory jobhistory;
  JobHistoryBloc({required this.jobhistory}) : super(JobHistoryInitial()) {
    on<JobHistoryEvent>((event, emit) async {
      try {
        emit(
          JobHistoryLoading(),
        );
        final result = await jobhistory.fatchDataJobHistor();
        if (result.status == 200) {
          emit(
            JobHistoryLoaded(result.data, result.status),
          );
        } else {
          emit(JobHistoryNoData(result.status.toString()));
        }
      } on FailureException catch (e) {
        emit(JobHistoryError(e.message));
      }
    });
  }
}
