part of 'update_goal_setting_bloc.dart';

abstract class UpdateGoalSettingEvent extends Equatable {
  const UpdateGoalSettingEvent();

  @override
  List<Object> get props => [];
}

class UpdateGoalSettingEventSubmit extends UpdateGoalSettingEvent {
  final String sectionId;
  final String formId;
  final String jobDesc;
  final String target;
  final String bobot;
  final String satuanTarget;

  const UpdateGoalSettingEventSubmit({
    required this.sectionId,
    required this.formId,
    required this.jobDesc,
    required this.target,
    required this.bobot,
    required this.satuanTarget,
  });

  @override
  List<Object> get props =>
      [sectionId, formId, jobDesc, target, bobot, satuanTarget];
}
