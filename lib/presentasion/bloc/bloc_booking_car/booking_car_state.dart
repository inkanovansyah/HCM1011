part of 'booking_car_bloc.dart';

class BookingCarState extends Equatable {
  const BookingCarState();

  @override
  List<Object> get props => [];
}

class BookingCarInitial extends BookingCarState {}

class BookingCarLoading extends BookingCarState {}

class BookingCarLoaded extends BookingCarState {
  final Data? data;
  final int status;
  final String? message;

  const BookingCarLoaded(
    this.data,
    this.status,
    this.message,
  );

  @override
  List<Object> get props => [data ?? [], status, message ?? ""];
}

class BookingCarNoData extends BookingCarState {
  final String message;
  const BookingCarNoData(this.message);
  @override
  List<Object> get props => [message];
}

class BookingCarError extends BookingCarState {
  final String message;
  const BookingCarError(this.message);
  @override
  List<Object> get props => [message];
}
