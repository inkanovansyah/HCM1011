import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/service/api_saldo.dart';
import 'package:hcm1011/data/model/saldo.dart';

part 'balance_event.dart';
part 'balance_state.dart';

class BalanceBloc extends Bloc<BalanceEvent, BalanceState> {
  final SaldoData ApiSaldo;

  BalanceBloc({required this.ApiSaldo}) : super(BalanceInitial()) {
    on<BalanceEvent>(
      (event, emit) async {
        try {
          emit(BalanceLoading());
          final result = await ApiSaldo.fetchDataSaldo();
          if (result.status == 200) {
            emit(
              BalanceLoaded(result.data, result.status),
            );
          } else {
            emit(BalanceNoData(result.status.toString()));
          }
        } on FailureException catch (e) {
          emit(BalanceError(e.message));
        }
      },
    );
  }
}
