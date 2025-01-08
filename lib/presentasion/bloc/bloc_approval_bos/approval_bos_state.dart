part of 'approval_bos_bloc.dart';

class ApprovalBosState extends Equatable {
  const ApprovalBosState();

  @override
  List<Object> get props => [];
}

class ApprovalBosInitial extends ApprovalBosState {}

class ApprovalBosLoading extends ApprovalBosState {}

class ApprovalBosLoaded extends ApprovalBosState {
  final Data? approvalBos;
  final int status;

  ApprovalBosLoaded(
    this.approvalBos,
    this.status,
  );

  @override
  List<Object> get props => [this.approvalBos!, this.status];
}

class ApprovalBosNoData extends ApprovalBosState {
  final String? message;
  ApprovalBosNoData(this.message);

  @override
  List<Object> get props => [this.message!];
}

class ApprovalBosError extends ApprovalBosState {
  final String? message;
  ApprovalBosError(this.message);

  @override
  List<Object> get props => [this.message!];
}
