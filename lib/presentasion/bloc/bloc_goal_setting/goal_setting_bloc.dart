import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:hcm1011/data/model/model_goal_setting.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/service/api_goal_seting.dart';
part 'goal_setting_event.dart';
part 'goal_setting_state.dart';

class GoalSettingBloc extends Bloc<GoalSettingEvent, GoalSettingState> {
  final GoalSettingList apiGoalSetting;

  GoalSettingBloc({
    required this.apiGoalSetting,
  }) : super(GoalSettingInitial()) {
    on<GoalSettingEvent>(
      (event, emit) async {
        try {
          emit(
            GoalSettingLoading(),
          );
          final result = await apiGoalSetting.factchGoal();

          if (result.status == 200) {
            emit(
              GoalSettingLoaded(result.data, result.status),
            );
          } else {
            emit(
              GoalSettingNoData(result.status.toString()),
            );
          }
        } on FailureException catch (e) {
          emit(
            GoalSettingError(e.message),
          );
        }
      },
    );
  }
}
