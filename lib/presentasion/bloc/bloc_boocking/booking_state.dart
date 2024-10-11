part of 'booking_bloc.dart';

abstract class BookingState extends Equatable {
  const BookingState();

  @override
  List<Object> get props => [];
}

class BookingInitial extends BookingState {}

class BookingLoading extends BookingState {}

class BookingLoaded extends BookingState {
  final Data? bookingList;
  final int? status;

  const BookingLoaded(this.bookingList, this.status);

  @override
  List<Object> get props => [bookingList ?? '', status ?? ''];
}

class BookingNoData extends BookingState {
  final String message;
  const BookingNoData(this.message);
  @override
  List<Object> get props => [message];
}

class BookingError extends BookingState {
  final String message;

  BookingError(this.message);
  @override
  List<Object> get props => [message];
}
