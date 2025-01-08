import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:hcm1011/data/model/approval_request.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/service/api_decline_leave.dart';

part 'decline_bos_event.dart';
part 'decline_bos_state.dart';

class DeclineBosBloc extends Bloc<DeclineBosEvent, DeclineBosState> {
  final ApiDeclineLeave apiDeclineLeave;
  DeclineBosBloc({required this.apiDeclineLeave}) : super(DeclineBosInitial()) {
    on<DeclineBos>(
      (event, emit) async {
        try {
          emit(DeclineBosLoading());

          final result =
              await apiDeclineLeave.fetchDataApproval(event.idDeclineLeave);
          if (result.data != null && result.status == 200) {
            emit(DeclineBosLoaded(result.data!, result.status ?? 0));
          } else {
            emit(DeclineBosError(result.status.toString()));
          }
        } on FailureException catch (e) {
          emit(DeclineBosError(e.message));
        }
      },
    );
  }
}
