part of 'update_goal_setting_bloc.dart';

abstract class UpdateGoalSettingState extends Equatable {
  const UpdateGoalSettingState();

  @override
  List<Object> get props => [];
}

class UpdateGoalSettingInitial extends UpdateGoalSettingState {}

class UpdateGoalSettingLoading extends UpdateGoalSettingState {}

class UpdateGoalSettingLoaded extends UpdateGoalSettingState {
  final SandUpdateGoalSettingData detailList;
  final int status;

  UpdateGoalSettingLoaded(this.detailList, this.status);

  @override
  List<Object> get props => [detailList ?? [], status];
}

class UpdateGoalSettingNoData extends UpdateGoalSettingState {
  final String message;
  const UpdateGoalSettingNoData(this.message);
  @override
  List<Object> get props => [message];
}

class UpdateGoalSettingError extends UpdateGoalSettingState {
  final String message;

  UpdateGoalSettingError(this.message);
  List<Object> get props => [message];
}
