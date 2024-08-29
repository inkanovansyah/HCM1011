part of 'notification_bloc.dart';

class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object> get props => [];
}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationLoaded extends NotificationState {
  final ListNotifikasionData? notificationList;
  final int? status;

  const NotificationLoaded(this.notificationList, this.status);

  @override
  List<Object> get props => [notificationList ?? '', status ?? ''];
}

class NotificationNoData extends NotificationState {
  final String message;
  const NotificationNoData(this.message);

  @override
  List<Object> get props => [message];
}

class NotificationError extends NotificationState {
  final String message;
  const NotificationError(this.message);

  @override
  List<Object> get props => [message];
}
