import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:hcm1011/data/service/api_edit_gs.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/editGoalSetting.dart';

part 'form_detail_id_event.dart';
part 'form_detail_id_state.dart';

class FormDetailIdBloc extends Bloc<FormDetailIdEvent, FormDetailIdState> {
  final ApiEditGs apiEditGS;

  FormDetailIdBloc({
    required this.apiEditGS,
  }) : super(FormDetailIdInitial()) {
    on<GetfromId>((event, emit) async {
      try {
        emit(FormDetailIdLoading());
        final edit_id = event.edit_id;
        final result = await apiEditGS.fachdataGs(edit_id);

        if (result.status == 200) {
          emit(FormDetailIdLoaded(result.data, result.status));
        } else {
          emit(FormDetailIdNoData(result.status.toString()));
        }
      } on FailureException catch (e) {
        emit(FormDetailIdError(e.message));
      }
    });
  }
}
