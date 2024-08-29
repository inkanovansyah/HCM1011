part of 'read_notification_bloc.dart';

abstract class ReadNotificationEvent extends Equatable {
  const ReadNotificationEvent();

  @override
  List<Object> get props => [];
}

class ReadNotificationGetEvent extends ReadNotificationEvent {
  final String idNotif;

  const ReadNotificationGetEvent({required this.idNotif});

  @override
  List<Object> get props => [idNotif];
}
