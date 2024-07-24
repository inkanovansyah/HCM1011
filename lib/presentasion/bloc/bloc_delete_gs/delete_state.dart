part of 'delete_bloc.dart';

abstract class DeleteDataState extends Equatable {
  const DeleteDataState();

  @override
  List<Object?> get props => [];
}

class DeleteDataInitial extends DeleteDataState {}

class DeleteDataLoading extends DeleteDataState {}

class DeleteDataLoaded extends DeleteDataState {
  final DalateGoalSetting goalSetting;
  final int status;

  DeleteDataLoaded(this.goalSetting, this.status);

  @override
  List<Object?> get props => [goalSetting, status];
}

class DeleteDataNoData extends DeleteDataState {
  final String message;

  const DeleteDataNoData(this.message);

  @override
  List<Object> get props => [message];
}

class DeleteDataError extends DeleteDataState {
  final String message;

  DeleteDataError(this.message);

  @override
  List<Object> get props => [message];
}
