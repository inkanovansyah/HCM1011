import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:hcm1011/data/model/bookinglist.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/service/api_list_booking.dart';

part 'booking_list_event.dart';
part 'booking_list_state.dart';

class BookingListBloc extends Bloc<BookingListEvent, BookingListState> {
  final ListBookingApi ApiBooking;
  BookingListBloc({required this.ApiBooking}) : super(BookingListInitial()) {
    on<BookingListEvent>((event, emit) async {
      try {
        emit(BookingListLoading());
        final result = await ApiBooking.fatchDataBookingList();
        if (result.status == 200) {
          emit(
            BookingListLoaded(result.data, result.status),
          );
        } else {
          emit(BookingListNoData(result.status.toString()));
        }
      } on FailureException catch (e) {
        emit(BookingListError(e.message));
      }
    });
  }
}
