part of 'goal_setting_bloc.dart';

abstract class GoalSettingState extends Equatable {
  const GoalSettingState();

  @override
  List<Object> get props => [];
}

class GoalSettingInitial extends GoalSettingState {}

class GoalSettingLoading extends GoalSettingState {}

class GoalSettingLoaded extends GoalSettingState {
  final List<Datum>? listGoal;
  final int? status;

  const GoalSettingLoaded(this.listGoal, this.status);

  @override
  List<Object> get props => [listGoal ?? '', status ?? ''];
}

class GoalSettingNoData extends GoalSettingState {
  final String message;
  const GoalSettingNoData(this.message);
  @override
  List<Object> get props => [message];
}

class GoalSettingError extends GoalSettingState {
  final String message;

  GoalSettingError(this.message);
  List<Object> get props => [message];
}
