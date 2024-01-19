part of 'payroll_bloc.dart';

abstract class PayrollState extends Equatable {
  const PayrollState();

  @override
  List<Object> get props => [];
}

class PayrollInitial extends PayrollState {}

class PayrollLoading extends PayrollState {}

class PayrollInfoLoaded extends PayrollState {
  final Data? dataPayroll;
  final int? status;

  const PayrollInfoLoaded(this.dataPayroll, this.status);
  @override
  List<Object> get props => [dataPayroll ?? '', status ?? 0];
}

class PayrollInfoNoData extends PayrollState {
  final String message;
  const PayrollInfoNoData(this.message);
  @override
  List<Object> get props => [message];
}

class PayrollInfoError extends PayrollState {
  final String message;

  PayrollInfoError(this.message);
  List<Object> get props => [message];
}
