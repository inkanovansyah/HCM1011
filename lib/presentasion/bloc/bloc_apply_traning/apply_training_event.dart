part of 'apply_training_bloc.dart';

abstract class ApplyTrainingEvent extends Equatable {
  const ApplyTrainingEvent();

  @override
  List<Object> get props => [];
}

class ApplyTriningEvent extends ApplyTrainingEvent {
  final String idschedule;

  const ApplyTriningEvent({required this.idschedule});

  @override
  List<Object> get props => [idschedule];
}
