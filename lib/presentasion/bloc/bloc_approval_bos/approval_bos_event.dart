part of 'approval_bos_bloc.dart';

class ApprovalBosEvent extends Equatable {
  const ApprovalBosEvent();

  @override
  List<Object> get props => [];
}

class GetApprovalBos extends ApprovalBosEvent {
  final String idLeave;

  const GetApprovalBos({required this.idLeave});

  @override
  List<Object> get props => [idLeave];
}
