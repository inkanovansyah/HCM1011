import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hcm1011/data/model/dalateGoalsetting.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/service/apI_dalate_gs_.dart';

part 'delete_event.dart';
part 'delete_state.dart';

class DeleteDataBloc extends Bloc<DeleteDataEvent, DeleteDataState> {
  final DeleteGs apiDeleteGS;

  DeleteDataBloc({required this.apiDeleteGS}) : super(DeleteDataInitial()) {
    on<DeleteGoalSettingEvent>(
      (event, emit) async {
        try {
          emit(DeleteDataLoading());

          final idAnswer = event.idAnswer;

          final result = await apiDeleteGS.fachdDeletegsDataGs(idAnswer);
          if (result.data != null && result.status == 200) {
            emit(DeleteDataLoaded(result, result.status ?? 0));
          } else {
            emit(DeleteDataNoData(result.status.toString()));
          }
        } on FailureException catch (e) {
          emit(DeleteDataError(e.message));
        }
      },
    );
  }
}
