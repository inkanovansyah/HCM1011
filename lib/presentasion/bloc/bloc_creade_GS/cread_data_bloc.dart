import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hcm1011/data/service/api_creat_gs.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/sand_goal_setting.dart';

part 'cread_data_event.dart';
part 'cread_data_state.dart';

class CreadDataBloc extends Bloc<CreadDataEvent, CreadDataState> {
  final CreateGs apiCreateGS;

  CreadDataBloc({
    required this.apiCreateGS,
  }) : super(CreadDataInitial()) {
    on<CreadDataEvent>((event, emit) async {
      try {
        emit(
          CreadDataLoading(),
        );
        final jobs_desc = event.jobs_desc;
        final target = event.target;
        final satuan_target = event.satuan_target;
        final section = event.section;
        final code_section = event.code_section;

        final result = await apiCreateGS.fachdataGs(
          jobs_desc,
          target,
          satuan_target,
          section,
          code_section,
        );
        if (result.data != null && result.status == 200) {
          emit(CreadDataLoaded(result.data!,
              result.status ?? 0)); // Gunakan non-null assertion operator
        } else {
          emit(
            CreadDataNoData(result.status.toString()),
          );
        }
      } on FailureException catch (e) {
        emit(
          CreadDataError(e.message),
        );
      }
    });
  }
}
