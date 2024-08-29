import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/replacment.dart';
import 'package:hcm1011/data/service/api_employe_replacement.dart';

part 'replacment_event.dart';
part 'replacment_state.dart';

class ReplacmentBloc extends Bloc<ReplacmentEvent, ReplacmentState> {
  final EmployeeReplacementapi apiReplacment;
  ReplacmentBloc({required this.apiReplacment}) : super(ReplacmentInitial()) {
    on<ReplacmentEvent>((event, emit) async {
      try {
        emit(ReplacmentLoading());

        final result = await apiReplacment.fatchDataReplacement();
        if (result.data != null && result.status == 200) {
          emit(ReplacmentLoaded(result.data!, result.status ?? 0));
        } else {
          emit(ReplacmentNoData(result.status.toString()));
        }
      } on FailureException catch (e) {
        emit(ReplacmentError(e.message));
      }
    });
  }
}
