import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:hcm1011/data/model/payroll.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/service/api_payroll.dart';

part 'payroll_event.dart';
part 'payroll_state.dart';

class PayrollBloc extends Bloc<PayrollEvent, PayrollState> {
  final DetailPayroll detailPayroll;

  PayrollBloc({required this.detailPayroll}) : super(PayrollInitial()) {
    on<PayrollEvent>(
      (event, emit) async {
        try {
          emit(
            PayrollLoading(),
          );
          final result = await detailPayroll.fatchDetailPayroll();
          if (result.status == 200) {
            emit(
              PayrollInfoLoaded(result.data, result.status),
            );
          } else {
            emit(
              PayrollInfoNoData(result.status.toString()),
            );
          }
        } on FailureException catch (e) {
          emit(
            PayrollInfoError(e.message),
          );
        }
      },
    );
  }
}
