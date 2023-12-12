import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:hcm1011/data/model/infolist.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/service/api_list.dart';

part 'list_info_event.dart';
part 'list_info_state.dart';

class ListInfoBloc extends Bloc<ListInfoEvent, ListInfoState> {
  final ListInfo apiinfo;

  ListInfoBloc({required this.apiinfo}) : super(ListInfoInitial()) {
    on<ListInfoEvent>(
      (event, emit) async {
        try {
          emit(
            ListInfoLoading(),
          );
          final result = await apiinfo.fetchListInfo();

          if (result.status == 200) {
            emit(
              ListInfoLoaded(result.data, result.status),
            );
          } else {
            emit(
              ListInfoNoData(result.status.toString()),
            );
          }
        } on FailureException catch (e) {
          emit(
            ListInfoError(e.message),
          );
        }
      },
    );
  }
}
