part of 'transaksi_booking_bloc.dart';

abstract class TransaksiBookingState extends Equatable {
  const TransaksiBookingState();

  @override
  List<Object> get props => [];
}

class TransaksiBookingInitial extends TransaksiBookingState {}

class TransaksiBookingLoading extends TransaksiBookingState {}

class TransaksiBookingLoaded extends TransaksiBookingState {
  final List<Datum>? transakiList;
  final int? status;
  const TransaksiBookingLoaded(this.transakiList, this.status);

  @override
  List<Object> get props => [transakiList ?? '', status ?? ''];
}

class TransaksiNoData extends TransaksiBookingState {
  final String message;
  const TransaksiNoData(this.message);
  @override
  List<Object> get props => [message];
}

class BookingError extends TransaksiBookingState {
  final String message;
  BookingError(this.message);
  @override
  List<Object> get props => [message];
}
