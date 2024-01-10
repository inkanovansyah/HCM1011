part of 'leave_bloc.dart';

abstract class LeaveEvent extends Equatable {
  const LeaveEvent();

  @override
  List<Object> get props => [];
}

class GetListLeave extends LeaveEvent {
  const GetListLeave();
}
