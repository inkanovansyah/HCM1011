part of 'submit_aproroval_gs_bloc.dart';

class SubmitAprorovalGsState extends Equatable {
  const SubmitAprorovalGsState();

  @override
  List<Object> get props => [];
}

class SubmitAprorovalGsInitial extends SubmitAprorovalGsState {}

class SubmitAprorovalGsLoading extends SubmitAprorovalGsState {}

class SubmitAprorovalGsLoaded extends SubmitAprorovalGsState {
  final Data? submitAprorovalGs;
  final int status;

  SubmitAprorovalGsLoaded(this.submitAprorovalGs, this.status);

  @override
  List<Object> get props => [submitAprorovalGs ?? 0, status];
}

class SubmitAprorovalGsNoData extends SubmitAprorovalGsState {
  final String message;
  const SubmitAprorovalGsNoData(this.message);
  @override
  List<Object> get props => [message];
}

class SubmitAprorovalGsError extends SubmitAprorovalGsState {
  final String message;
  SubmitAprorovalGsError(this.message);
  @override
  List<Object> get props => [message];
}
