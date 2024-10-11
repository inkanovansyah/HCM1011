part of 'read_notification_bloc.dart';

class ReadNotificationState extends Equatable {
  const ReadNotificationState();

  @override
  List<Object> get props => [];
}

class ReadNotificationInitial extends ReadNotificationState {}

class ReadNotificationLoading extends ReadNotificationState {}

class ReadNotificationLoaded extends ReadNotificationState {
  final AddNotification addData;
  final int status;

  ReadNotificationLoaded(this.addData, this.status);

  @override
  List<Object> get props => [addData, status];
}

class ReadNotificationNoData extends ReadNotificationState {
  final String message;

  const ReadNotificationNoData(this.message);

  @override
  List<Object> get props => [message];
}

class ReadNotificationDataError extends ReadNotificationState {
  final String message;

  ReadNotificationDataError(this.message);

  @override
  List<Object> get props => [message];
}
