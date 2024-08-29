import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hcm1011/data/model/applyCarBooking.dart';
import 'package:hcm1011/data/model/failure_exception.dart';

import 'package:hcm1011/data/service/api-creat-booking.dart';

part 'booking_car_event.dart';
part 'booking_car_state.dart';

class BookingCarBloc extends Bloc<BookingCarEvent, BookingCarState> {
  final ApplyCarBooking ApplyCarBookingapi;

  BookingCarBloc({required this.ApplyCarBookingapi})
      : super(BookingCarInitial()) {
    on<GetBookingCar>((event, emit) async {
      try {
        emit(BookingCarLoading());
        // final bookingmobil_id = event.bookingmobil_id;

        final deskripsi = event.deskripsi;
        final bookingStart = event.bookingStart;
        final bookingEnd = event.bookingEnd;
        final result = await ApplyCarBookingapi.fatchDataApplyCarBooking(
            deskripsi, bookingStart, bookingEnd);
        if (result.data != null && result.status == 200) {
          emit(BookingCarLoaded(
              result.data!, result.status ?? 0, result.message));
        } else {
          emit(BookingCarNoData(result.status.toString()));
        }
      } on FailureException catch (e) {
        emit(BookingCarError(e.message));
      }
    });
  }
}
