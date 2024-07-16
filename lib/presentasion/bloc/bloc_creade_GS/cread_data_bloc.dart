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
    on<SubmitDataEvent>((event, emit) async {
      try {
        emit(CreadDataLoading());

        final jobDesc = event.jobDesc;
        final target = event.target;
        final satuanTarget = event.satuanTarget;
        final bobot = event.bobot;
        final sesionId = event.sesionId;

        final result = await apiCreateGS.fachdataGs(
          jobDesc,
          target,
          satuanTarget,
          bobot,
          sesionId,
        );
        if (result.data != null && result.status == 200) {
          emit(CreadDataLoaded(result.data!, result.status ?? 0));
        } else {
          emit(CreadDataNoData(result.status.toString()));
        }
      } on FailureException catch (e) {
        emit(CreadDataError(e.message));
      }
    });
  }
}
