part of 'payroll_bloc.dart';

abstract class PayrollEvent extends Equatable {
  const PayrollEvent();

  @override
  List<Object> get props => [];
}

class FetchPayrollDetail extends PayrollEvent {
  final String month;

  const FetchPayrollDetail({required this.month});

  @override
  List<Object> get props => [month];
}
