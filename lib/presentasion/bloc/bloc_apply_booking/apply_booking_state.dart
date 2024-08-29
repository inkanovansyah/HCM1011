part of 'apply_booking_bloc.dart';

class ApplyBookingState extends Equatable {
  const ApplyBookingState();

  @override
  List<Object> get props => [];
}

class ApplyBookingInitial extends ApplyBookingState {}

class ApplyBookingLoading extends ApplyBookingState {}

class ApplyBookingLoaded extends ApplyBookingState {
  final DataData? data;
  final int status;

  const ApplyBookingLoaded(
    this.data,
    this.status,
  );

  @override
  List<Object> get props => [data ?? [], status];
}

class ApplyBookingNoData extends ApplyBookingState {
  final String message;
  const ApplyBookingNoData(this.message);
  @override
  List<Object> get props => [message];
}

class ApplyBookingError extends ApplyBookingState {
  final String message;
  const ApplyBookingError(this.message);
  @override
  List<Object> get props => [message];
}
