import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/type_cuti.dart';
import 'package:hcm1011/data/service/api_jenis_cuti.dart';

part 'type_leave_event.dart';
part 'type_leave_state.dart';

class TypeLeaveBloc extends Bloc<TypeLeaveEvent, TypeLeaveState> {
  final TypeLeaveListapi apiTypeofleave;
  TypeLeaveBloc({required this.apiTypeofleave}) : super(TypeLeaveInitial()) {
    on<TypeLeaveEvent>((event, emit) async {
      try {
        emit(TypeLeaveLoading());
        final result = await apiTypeofleave.fetchTypeLeave();
        if (result.data != null && result.status == 200) {
          emit(TypeLeaveLoaded(result.data!, result.status ?? 0));
        } else {
          emit(TypeLeaveNoData(result.status.toString()));
        }
      } on FailureException catch (e) {
        emit(TypeLeaveError(e.message));
      }
    });
  }
}
