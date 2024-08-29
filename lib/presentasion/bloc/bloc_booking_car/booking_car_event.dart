part of 'booking_car_bloc.dart';

abstract class BookingCarEvent extends Equatable {
  const BookingCarEvent();

  @override
  List<Object> get props => [];
}

class GetBookingCar extends BookingCarEvent {
  final String bookingmobil_id;

  final String deskripsi;
  final String bookingStart;
  final String bookingEnd;

  const GetBookingCar({
    required this.bookingmobil_id,
    required this.deskripsi,
    required this.bookingStart,
    required this.bookingEnd,
  });

  @override
  List<Object> get props => [
        bookingmobil_id,
        deskripsi,
        bookingStart,
        bookingEnd,
      ];
}
