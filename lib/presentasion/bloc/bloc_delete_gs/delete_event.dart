part of 'delete_bloc.dart';

abstract class DeleteDataEvent extends Equatable {
  const DeleteDataEvent();

  @override
  List<Object> get props => [];
}

class DeleteGoalSettingEvent extends DeleteDataEvent {
  final String idAnswer;

  const DeleteGoalSettingEvent({required this.idAnswer});

  @override
  List<Object> get props => [idAnswer];
}
