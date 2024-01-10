import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:hcm1011/data/model/kpi_detail.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/service/api_kpi_detail.dart';

part 'kpi_event.dart';
part 'kpi_state.dart';

class KpiBloc extends Bloc<KpiEvent, KpiState> {
  final KpiDetail apiDetailKpi;

  KpiBloc({
    required this.apiDetailKpi,
  }) : super(KpiInitial()) {
    on<KpiEvent>(
      (event, emit) async {
        try {
          emit(
            KpiLoading(),
          );
          final result = await apiDetailKpi.fatchDetailKpi();
          if (result.status == 200) {
            emit(
              KpiLoaded(result.data, result.status),
            );
          } else {
            emit(
              KpiNoData(result.status.toString()),
            );
          }
        } on FailureException catch (e) {
          emit(
            KpiError(e.message),
          );
        }
      },
    );
  }
}
