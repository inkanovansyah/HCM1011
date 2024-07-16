import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/list_satuan.dart';
import 'package:hcm1011/data/service/api_satuan_kpi.dart';

part 'bloc_satuan_event.dart';
part 'bloc_satuan_state.dart';

class BlocSatuanBloc extends Bloc<SatuanEvent, SatuanState> {
  final ListSatuanList apiSatuanKpi;

  BlocSatuanBloc({
    required this.apiSatuanKpi,
  }) : super(SatuanInitial()) {
    on<SatuanEvent>((event, emit) async {
      try {
        emit(
          SatuanInitial(),
        );
        final result = await apiSatuanKpi.factchSatuan();

        if (result.status == 200) {
          emit(
            SatuanLoaded(result.data, result.status),
          );
        } else {
          emit(
            SatuanNoData(result.status.toString()),
          );
        }
      } on FailureException catch (e) {
        emit(
          SatuanError(e.message),
        );
      }
    });
  }
}
