import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:hcm1011/data/model/info.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/service/api_service.dart';

part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  final ListInfoBanner apiListInfo;

  ListBloc({
    required this.apiListInfo,
  }) : super(InfoInitial()) {
    on<GetListInfo>(
      (event, emit) async {
        try {
          emit(
            InfoLoading(),
          );
          final result = await apiListInfo.fetchDatainfo();

          if (result.status == 200) {
            emit(
              InfoLoaded(result.data, result.status),
            );
          } else {
            emit(
              InfoNoData(result.status.toString()),
            );
          }
        } on FailureException catch (e) {
          emit(
            InfoError(e.message),
          );
        }
      },
    );
  }
}
