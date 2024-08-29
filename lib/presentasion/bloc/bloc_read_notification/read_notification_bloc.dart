import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hcm1011/data/model/readnotification.dart';
import 'package:hcm1011/data/model/failure_exception.dart';
import 'package:hcm1011/data/service/api_notification_read.dart';

part 'read_notification_event.dart';
part 'read_notification_state.dart';

class ReadNotificationBloc
    extends Bloc<ReadNotificationEvent, ReadNotificationState> {
  final readNotification apiReadNotif;
  ReadNotificationBloc({required this.apiReadNotif})
      : super(ReadNotificationInitial()) {
    on<ReadNotificationGetEvent>((event, emit) async {
      try {
        emit(ReadNotificationLoading());
        final idNotif = event.idNotif;
        final result = await apiReadNotif.fachtDataRead(idNotif);

        if (result.data != null && result.status == 200) {
          emit(ReadNotificationLoaded(result, result.status ?? 0));
        } else {
          emit(ReadNotificationNoData(result.status.toString()));
        }
      } on FailureException catch (e) {
        emit(ReadNotificationDataError(e.message));
      }
    });
  }
}
