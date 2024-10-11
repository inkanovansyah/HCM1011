part of 'booking_list_bloc.dart';

class BookingListEvent extends Equatable {
  const BookingListEvent();

  @override
  List<Object> get props => [];
}

class GetBookingList extends BookingListEvent {
  const GetBookingList();
}
