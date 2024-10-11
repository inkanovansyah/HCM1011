import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:hcm1011/data/model/schadeule.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/service/api_schedule_trining.dart';

part 'schadule_list_event.dart';
part 'schadule_list_state.dart';

class SchaduleListBloc extends Bloc<SchaduleListEvent, SchaduleListState> {
  final ApiScheduleTrining apiScheduleTrining;
  SchaduleListBloc({
    required this.apiScheduleTrining,
  }) : super(SchaduleListInitial()) {
    on<SchaduleListEvent>((event, emit) async {
      try {
        emit(
          SchaduleListLoading(),
        );
        final result = await apiScheduleTrining.fatchListSchedule();
        if (result.status == 200) {
          emit(
            SchaduleListLoaded(result.data, result.status),
          );
        } else {
          emit(
            SchaduleListNoData(result.status.toString()),
          );
        }
      } on FailureException catch (e) {
        emit(
          SchaduleListError(e.message),
        );
      }
    });
  }
}
