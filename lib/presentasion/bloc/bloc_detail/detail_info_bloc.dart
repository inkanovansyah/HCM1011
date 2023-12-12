import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:hcm1011/data/service/api_detail.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/detailinfo.dart';

part 'detail_info_event.dart';
part 'detail_info_state.dart';

class DetailInfoBloc extends Bloc<DetailInfoEvent, DetailInfoState> {
  final DetailInfo apiDetailInfo;

  DetailInfoBloc({
    required this.apiDetailInfo,
  }) : super(DetailInfoInitial()) {
    on<GetDetailInfo>((event, emit) async {
      try {
        emit(
          DetailInfoLoading(),
        );
        final info_id = event.info_id;
        final result = await apiDetailInfo.fetchDataDetail(info_id);

        if (result.status == 200) {
          emit(
            DetailInfoLoaded(result.data, result.status),
          );
        } else {
          emit(
            DetailInfoNoData(result.status.toString()),
          );
        }
      } on FailureException catch (e) {
        emit(
          DetailInfoError(e.message),
        );
      }
    });
  }
}
