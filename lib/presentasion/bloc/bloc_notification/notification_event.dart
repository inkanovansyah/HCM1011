part of 'notification_bloc.dart';

class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object> get props => [];
}

class GetNotificationList extends NotificationEvent {
  const GetNotificationList();
}
