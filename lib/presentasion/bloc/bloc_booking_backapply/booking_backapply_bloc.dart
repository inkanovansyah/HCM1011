import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:hcm1011/data/model/appCar.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/service/api_apply_car.dart';

part 'booking_backapply_event.dart';
part 'booking_backapply_state.dart';

class BookingBackapplyBloc
    extends Bloc<BookingBackapplyEvent, BookingBackapplyState> {
  final ApplyCarApi apiBackTraining;
  BookingBackapplyBloc({required this.apiBackTraining})
      : super(BookingBackapplyInitial()) {
    on<BookingBackEvent>(
      (event, emit) async {
        try {
          emit(BookingBackapplyLoading());
          final idbooking = event.idbooking;

          final result = await apiBackTraining.fatchDataApplyCar(idbooking);

          if (result.data != null && result.status == 200) {
            emit(BookingBackapplyLoaded(result.data, result.status ?? 0));
          } else {
            emit(BookingBackapplyNoData(result.status.toString()));
          }
        } on FailureException catch (e) {
          emit(BookingBackapplyError(e.message));
        }
      },
    );
  }
}
