import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:hcm1011/data/model/booking.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/service/api_booking_list.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final BookingList apiBookingList;
  BookingBloc({
    required this.apiBookingList,
  }) : super(BookingInitial()) {
    on<BookingEvent>(
      (event, emit) async {
        try {
          emit(BookingLoading());
          final result = await apiBookingList.fatchDataBookingList();
          if (result.status == 200) {
            emit(BookingLoaded(result.data, result.status));
          } else {
            emit(BookingNoData(result.status.toString()));
          }
        } on FailureException catch (e) {
          emit(BookingError(e.message));
        }
      },
    );
  }
}
