part of 'booking_backapply_bloc.dart';

abstract class BookingBackapplyState extends Equatable {
  const BookingBackapplyState();

  @override
  List<Object> get props => [];
}

class BookingBackapplyInitial extends BookingBackapplyState {}

class BookingBackapplyLoading extends BookingBackapplyState {}

class BookingBackapplyLoaded extends BookingBackapplyState {
  final Data? backBooking;
  final int status;

  BookingBackapplyLoaded(this.backBooking, this.status);

  @override
  List<Object> get props => [backBooking ?? [], status];
}

class BookingBackapplyNoData extends BookingBackapplyState {
  final String message;

  const BookingBackapplyNoData(this.message);

  @override
  List<Object> get props => [message];
}

class BookingBackapplyError extends BookingBackapplyState {
  final String message;

  const BookingBackapplyError(this.message);

  @override
  List<Object> get props => [message];
}
