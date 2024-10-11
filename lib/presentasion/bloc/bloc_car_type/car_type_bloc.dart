import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/model/typecar.dart';
import 'package:hcm1011/data/service/api_list_car_type.dart';

part 'car_type_event.dart';
part 'car_type_state.dart';

class CarTypeBloc extends Bloc<CarTypeEvent, CarTypeState> {
  final ListCarType apiCarType;
  CarTypeBloc({required this.apiCarType}) : super(CarTypeInitial()) {
    on<CarTypeEvent>((event, emit) async {
      try {
        emit(CarTypeLoading());
        final result = await apiCarType.fatchDataListCarType();
        if (result.data != null && result.status == 200) {
          emit(CarTypeLoaded(result.data!, result.status ?? 0));
        } else {
          emit(CarTypeNoData(result.status.toString()));
        }
      } on FailureException catch (e) {
        emit(CarTypeError(e.message));
      }
    });
  }
}
