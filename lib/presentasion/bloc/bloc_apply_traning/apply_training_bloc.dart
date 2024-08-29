import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:hcm1011/data/model/addTrining.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/service/api_apply_add_trining.dart';

part 'apply_training_event.dart';
part 'apply_training_state.dart';

class ApplyTrainingBloc extends Bloc<ApplyTrainingEvent, ApplyTrainingState> {
  final addTrining apiTraining;
  ApplyTrainingBloc({required this.apiTraining})
      : super(ApplyTrainingInitial()) {
    on<ApplyTriningEvent>(
      (event, emit) async {
        try {
          emit(ApplyTrainingLoading());
          final idschedule = event.idschedule;
          final result = await apiTraining.fatchDataApplyTraining(idschedule);

          if (result.data != null && result.status == 200) {
            emit(ApplyTrainingLoaded(result, result.status ?? 0));
          } else {
            emit(ApplyTrainingNoData(result.status.toString()));
          }
        } on FailureException catch (e) {
          emit(ApplyTrainingError(e.message));
        }
      },
    );
  }
}
