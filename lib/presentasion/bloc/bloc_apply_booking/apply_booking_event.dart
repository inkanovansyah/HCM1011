part of 'apply_booking_bloc.dart';

class ApplyBookingEvent extends Equatable {
  const ApplyBookingEvent();

  @override
  List<Object> get props => [];
}

class ApplyBookingSubmitEvent extends ApplyBookingEvent {
  final String room;
  final String title;
  final String descrip;
  final String startdate;
  final String enddate;
  const ApplyBookingSubmitEvent({
    required this.room,
    required this.title,
    required this.descrip,
    required this.startdate,
    required this.enddate,
  });

  @override
  List<Object> get props => [room, title, descrip, startdate, enddate];
}
