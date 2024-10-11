import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:hcm1011/data/service/api_edit_gs.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/editGoalSetting.dart';

part 'edit_kpi_event.dart';
part 'edit_kpi_state.dart';

class EditKpiBloc extends Bloc<EditKpiEvent, EditKpiState> {
  final ApiEditGs apiEditKpi;
  EditKpiBloc({
    required this.apiEditKpi,
  }) : super(EditKpiInitial()) {
    on<EditKpi>(
      (event, emit) async {
        try {
          emit(EditKpiLoading());
          final editFormKpi = event.editkpi_id;
          final result = await apiEditKpi.fachdataGs(editFormKpi);
          if (result.status == 200) {
            emit(EditKpiLoaded(result.data, result.status));
          } else {
            emit(EditKpiNoData(result.status.toString()));
          }
        } on FailureException catch (e) {
          emit(EditKpiError(e.message));
        }
      },
    );
  }
}
