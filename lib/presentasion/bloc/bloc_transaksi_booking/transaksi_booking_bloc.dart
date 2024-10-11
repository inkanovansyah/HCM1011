import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:hcm1011/data/service/api_list_transaksi_car.dart';
import 'package:hcm1011/data/model/listTransaksiBooking.dart';
import 'package:hcm1011/data/model/failure_exception.dart';

part 'transaksi_booking_event.dart';
part 'transaksi_booking_state.dart';

class TransaksiBookingBloc
    extends Bloc<TransaksiBookingEvent, TransaksiBookingState> {
  final TransaksiRoomType apiBookingList;
  TransaksiBookingBloc({
    required this.apiBookingList,
  }) : super(TransaksiBookingInitial()) {
    on<TransaksiBookingEvent>((event, emit) async {
      try {
        emit(TransaksiBookingLoading());
        final result = await apiBookingList.fatchDataTransaksiBooking();
        if (result.status == 200) {
          emit(TransaksiBookingLoaded(result.data, result.status));
        } else {
          emit(TransaksiNoData(result.status.toString()));
        }
      } on FailureException catch (e) {
        emit(BookingError(e.message));
      }
    });
  }
}
