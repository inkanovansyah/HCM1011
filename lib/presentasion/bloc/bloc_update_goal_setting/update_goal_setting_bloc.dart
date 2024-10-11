import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hcm1011/data/model/applyUpdateGoalSetting.dart';
import 'package:hcm1011/data/model/failure_exception.dart';

import 'package:hcm1011/data/service/api_update_goalsetting.dart';

part 'update_goal_setting_event.dart';
part 'update_goal_setting_state.dart';

class UpdateGoalSettingBloc
    extends Bloc<UpdateGoalSettingEvent, UpdateGoalSettingState> {
  final UpdateGs apiUpdateGS;
  UpdateGoalSettingBloc({
    required this.apiUpdateGS,
  }) : super(UpdateGoalSettingInitial()) {
    on<UpdateGoalSettingEventSubmit>(
      (event, emit) async {
        try {
          emit(UpdateGoalSettingLoading());
          final sectionId = event.sectionId;
          final formId = event.formId;
          final jobDesc = event.jobDesc;
          final target = event.target;
          final actual = event.bobot;
          final satuanTarget = event.satuanTarget;
          final updateGoalSetting = event.updateGoalSetting;

          final result = await apiUpdateGS.fachdataGs(
            sectionId,
            formId,
            jobDesc,
            target,
            actual,
            satuanTarget,
            updateGoalSetting,
          );
          if (result.data != null && result.status == 200) {
            emit(UpdateGoalSettingLoaded(result.data!, result.status ?? 0));
          } else {
            emit(UpdateGoalSettingNoData(result.status.toString()));
          }
        } on FailureException catch (e) {
          emit(UpdateGoalSettingError(e.message));
        }
      },
    );
  }
}
