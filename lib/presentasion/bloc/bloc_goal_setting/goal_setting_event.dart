part of 'goal_setting_bloc.dart';

abstract class GoalSettingEvent extends Equatable {
  const GoalSettingEvent();

  @override
  List<Object> get props => [];
}

class GoalSetting extends GoalSettingEvent {
  const GoalSetting();
}
