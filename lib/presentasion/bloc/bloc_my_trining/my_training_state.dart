part of 'my_training_bloc.dart';

abstract class MyTrainingState extends Equatable {
  const MyTrainingState();

  @override
  List<Object> get props => [];
}

class MyTrainingInitial extends MyTrainingState {}

class MyTriningLoading extends MyTrainingState {}

class MyTriningLoaded extends MyTrainingState {
  final Data? data;
  final int? status;

  const MyTriningLoaded(this.data, this.status);
  @override
  List<Object> get props => [data ?? '', status ?? 0];
}

class MyTriningNoData extends MyTrainingState {
  final String messages;
  const MyTriningNoData(this.messages);
  @override
  List<Object> get props => [messages];
}

class MyTriningError extends MyTrainingState {
  final String messages;

  MyTriningError(this.messages);
  List<Object> get props => [messages];
}
