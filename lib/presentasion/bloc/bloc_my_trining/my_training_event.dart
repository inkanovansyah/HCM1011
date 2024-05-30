part of 'my_training_bloc.dart';

abstract class MyTrainingEvent extends Equatable {
  const MyTrainingEvent();

  @override
  List<Object> get props => [];
}

class GetMyTraining extends MyTrainingEvent {
  const GetMyTraining();
}
