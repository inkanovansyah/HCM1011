part of 'booking_backapply_bloc.dart';

abstract class BookingBackapplyEvent extends Equatable {
  const BookingBackapplyEvent();

  @override
  List<Object> get props => [];
}

class BookingBackEvent extends BookingBackapplyEvent {
  final String idbooking;

  const BookingBackEvent({required this.idbooking});

  @override
  List<Object> get props => [idbooking];
}
