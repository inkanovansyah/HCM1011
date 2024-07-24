part of 'submit_gs_bloc.dart';

class SubmitGsState extends Equatable {
  const SubmitGsState();

  @override
  List<Object> get props => [];
}

class SubmitGsInitial extends SubmitGsState {}

class SubmitGsLoading extends SubmitGsState {}

class SubmitGsLoaded extends SubmitGsState {
  final Data? detailList;
  final int status;

  SubmitGsLoaded(this.detailList, this.status);

  @override
  List<Object> get props => [detailList ?? 0, status];
}

class SubmitGsNoData extends SubmitGsState {
  final String message;
  const SubmitGsNoData(this.message);
  @override
  List<Object> get props => [message];
}

class SubmitGsError extends SubmitGsState {
  final String message;
  SubmitGsError(this.message);
  @override
  List<Object> get props => [message];
}
