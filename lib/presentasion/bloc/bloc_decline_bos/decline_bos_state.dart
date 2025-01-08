part of 'decline_bos_bloc.dart';

class DeclineBosState extends Equatable {
  const DeclineBosState();

  @override
  List<Object> get props => [];
}

class DeclineBosInitial extends DeclineBosState {}

class DeclineBosLoading extends DeclineBosState {}

class DeclineBosLoaded extends DeclineBosState {
  final Data? approvalBos;
  final int status;

  DeclineBosLoaded(this.approvalBos, this.status);

  @override
  List<Object> get props => [approvalBos!, status];
}

class DeclineBosNoData extends DeclineBosState {
  final String? message;
  DeclineBosNoData(this.message);

  @override
  List<Object> get props => [this.message!];
}

class DeclineBosError extends DeclineBosState {
  final String? message;
  DeclineBosError(this.message);

  @override
  List<Object> get props => [this.message!];
}
