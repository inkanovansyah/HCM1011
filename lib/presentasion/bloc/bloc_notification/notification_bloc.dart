import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:hcm1011/data/model/notification.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/service/api_notification.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationList ApiNotification;
  NotificationBloc({required this.ApiNotification})
      : super(NotificationInitial()) {
    on<NotificationEvent>((event, emit) async {
      try {
        emit(NotificationLoading());
        final result = await ApiNotification.fatchDataNotificationList();
        if (result.status == 200) {
          emit(
            NotificationLoaded(result.data, result.status),
          );
        } else {
          emit(NotificationNoData(result.status.toString()));
        }
      } on FailureException catch (e) {
        emit(NotificationError(e.message));
      }
    });
  }
}
