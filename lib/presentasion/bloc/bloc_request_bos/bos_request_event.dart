part of 'bos_request_bloc.dart';

class BosRequestEvent extends Equatable {
  const BosRequestEvent();

  @override
  List<Object> get props => [];
}

class GetListLeaveRequest extends BosRequestEvent {
  const GetListLeaveRequest();
}
