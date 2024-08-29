part of 'balance_bloc.dart';

class BalanceState extends Equatable {
  const BalanceState();

  @override
  List<Object> get props => [];
}

class BalanceInitial extends BalanceState {}

class BalanceLoading extends BalanceState {}

class BalanceLoaded extends BalanceState {
  final Data? data;
  final int? status;

  const BalanceLoaded(this.data, this.status);

  @override
  List<Object> get props => [data ?? [], status ?? []];
}

class BalanceNoData extends BalanceState {
  final String message;
  const BalanceNoData(this.message);
  @override
  List<Object> get props => [message];
}

class BalanceError extends BalanceState {
  final String message;
  const BalanceError(this.message);
  @override
  List<Object> get props => [message];
}
