part of 'apply_leave_bloc.dart';

abstract class ApplyLeaveEvent extends Equatable {
  const ApplyLeaveEvent();

  @override
  List<Object> get props => [];
}

class ApplyLeaveSubmitEvent extends ApplyLeaveEvent {
  final String descrip;
  final String startdate;
  final String enddate;
  final String leaveType;

  const ApplyLeaveSubmitEvent({
    required this.descrip,
    required this.startdate,
    required this.enddate,
    required this.leaveType,
  });
  @override
  List<Object> get props => [descrip, startdate, enddate];
}
