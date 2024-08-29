part of 'booking_list_bloc.dart';

class BookingListState extends Equatable {
  const BookingListState();

  @override
  List<Object> get props => [];
}

class BookingListInitial extends BookingListState {}

class BookingListLoading extends BookingListState {}

class BookingListLoaded extends BookingListState {
  final List<Datum>? bookingList;
  final int? status;

  const BookingListLoaded(this.bookingList, this.status);

  @override
  List<Object> get props => [bookingList ?? '', status ?? ''];
}

class BookingListNoData extends BookingListState {
  final String message;
  const BookingListNoData(this.message);

  @override
  List<Object> get props => [message];
}

class BookingListError extends BookingListState {
  final String message;
  const BookingListError(this.message);

  @override
  List<Object> get props => [message];
}
