part of 'balance_bloc.dart';

class BalanceEvent extends Equatable {
  const BalanceEvent();

  @override
  List<Object> get props => [];
}

class GetBalance extends BalanceEvent {
  const GetBalance();
}
