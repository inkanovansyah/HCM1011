part of 'leave_bloc.dart';

abstract class LeaveState extends Equatable {
  const LeaveState();

  @override
  List<Object> get props => [];
}

class LeaveInitial extends LeaveState {}

class LeaveLoading extends LeaveState {}

class LeaveLoaded extends LeaveState {
  final Data? leaveList;
  final int? status;

  const LeaveLoaded(this.leaveList, this.status);

  @override
  List<Object> get props => [leaveList ?? '', status ?? 0];
}

class LeaveNoData extends LeaveState {
  final String messages;
  const LeaveNoData(this.messages);
  @override
  List<Object> get props => [messages];
}

class LeaveError extends LeaveState {
  final String messages;

  LeaveError(this.messages);
  List<Object> get props => [messages];
}
