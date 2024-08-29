part of 'apply_leave_bloc.dart';

class ApplyLeaveState extends Equatable {
  const ApplyLeaveState();

  @override
  List<Object> get props => [];
}

class ApplyLeaveInitial extends ApplyLeaveState {}

class ApplyLeaveLoading extends ApplyLeaveState {}

class ApplyLeaveLoaded extends ApplyLeaveState {
  final Data? data;
  final int status;

  const ApplyLeaveLoaded(
    this.data,
    this.status,
  );

  @override
  List<Object> get props => [data ?? [], status];
}

class ApplyLeaveNoData extends ApplyLeaveState {
  final String message;
  const ApplyLeaveNoData(this.message);
  @override
  List<Object> get props => [message];
}

class ApplyLeaveError extends ApplyLeaveState {
  final String message;
  const ApplyLeaveError(this.message);
  @override
  List<Object> get props => [message];
}
