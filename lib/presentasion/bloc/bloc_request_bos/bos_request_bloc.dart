import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:hcm1011/data/model/boss_request.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/service/api_bos.dart';

part 'bos_request_event.dart';
part 'bos_request_state.dart';

class BosRequestBloc extends Bloc<BosRequestEvent, BosRequestState> {
  final ApiBos listRequstBos;

  BosRequestBloc({
    required this.listRequstBos,
  }) : super(BosRequestInitial()) {
    on<BosRequestEvent>((event, emit) async {
      try {
        emit(BosRequestLoading());

        final result = await listRequstBos.fatchGetBossRequest();
        if (result.status == 200) {
          emit(BosRequestLoaded(result.data, result.status, result.messages));
        } else {
          emit(BosRequestNoData(result.status.toString()));
        }
      } on FailureException catch (e) {
        emit(BosRequestError(e.message));
      }
    });
  }
}
