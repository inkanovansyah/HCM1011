part of 'apply_training_bloc.dart';

abstract class ApplyTrainingState extends Equatable {
  const ApplyTrainingState();

  @override
  List<Object> get props => [];
}

class ApplyTrainingInitial extends ApplyTrainingState {}

class ApplyTrainingLoading extends ApplyTrainingState {}

class ApplyTrainingLoaded extends ApplyTrainingState {
  final AddTrining addTraining;
  final int status;

  ApplyTrainingLoaded(this.addTraining, this.status);

  @override
  List<Object> get props => [addTraining, status];
}

class ApplyTrainingNoData extends ApplyTrainingState {
  final String message;

  const ApplyTrainingNoData(this.message);

  @override
  List<Object> get props => [message];
}

class ApplyTrainingError extends ApplyTrainingState {
  final String message;

  const ApplyTrainingError(this.message);

  @override
  List<Object> get props => [message];
}
