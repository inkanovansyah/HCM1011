import 'package:get_it/get_it.dart';
import 'package:hcm1011/data/service/api_service.dart';
import 'package:hcm1011/data/service/api_kpi_detail.dart';
import 'package:hcm1011/data/service/api_list.dart';
import 'package:hcm1011/data/service/api_detail.dart';

import 'package:hcm1011/data/service/api_leave_list.dart';
import 'package:hcm1011/data/service/api_list_story.dart';
import 'package:hcm1011/data/service/api_goal_seting.dart';
import 'package:hcm1011/data/service/api_creat_gs.dart';
import 'package:hcm1011/data/service/api_satuan_kpi.dart';
import 'package:hcm1011/data/service/my-trening.dart';
import 'package:hcm1011/data/service/apI_dalate_gs_.dart';
import 'package:hcm1011/data/service/api_submit.dart';
import 'package:hcm1011/data/service/api_jenis_cuti.dart';
import 'package:hcm1011/data/service/api_salf_submit_approval_gs.dart';
import 'package:hcm1011/data/service/api_apply_leave.dart';
import 'package:hcm1011/data/service/api_auth.dart';
import 'package:hcm1011/data/service/api_employe_replacement.dart';
import 'package:hcm1011/data/service/api_booking_list.dart';
import 'package:hcm1011/data/service/api_room_type.dart';
import 'package:hcm1011/data/service/api_apply_room.dart';
import 'package:hcm1011/data/service/api_list_booking.dart';
import 'package:hcm1011/data/service/api_notification.dart';
import 'package:hcm1011/data/service/api_saldo.dart';
import 'package:hcm1011/data/service/api_list_transaksi_car.dart';
import 'package:hcm1011/data/service/api-creat-booking.dart';
import 'package:hcm1011/data/service/api_schedule_trining.dart';
import 'package:hcm1011/data/service/api_apply_add_trining.dart';
import 'package:hcm1011/data/service/api_notification_read.dart';
import 'package:hcm1011/data/service/api_edit_gs.dart';
import 'package:hcm1011/data/service/api_update_goalsetting.dart';
import 'package:hcm1011/data/service/api_apply_car.dart';
import 'package:hcm1011/data/service/api_list_car_type.dart';
import 'package:hcm1011/data/service/api_delete_story.dart';
import 'package:hcm1011/data/service/api_delete_booking_room.dart';
import 'package:hcm1011/presentasion/bloc/bloc_form_detail_id/form_detail_id_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_delete_room_booking/delete_booking_room_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_delate_story/delate_story_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_car_type/car_type_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_edit_kpi/edit_kpi_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_booking_backapply/booking_backapply_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_update_goal_setting/update_goal_setting_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_read_notification/read_notification_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_apply_traning/apply_training_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_achadule_list/schadule_list_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_booking_car/booking_car_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_transaksi_booking/transaksi_booking_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_balance/balance_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_booking_list/booking_list_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_notification/notification_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_apply_booking/apply_booking_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_type_room/room_type_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_boocking/booking_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_auth/auth_login_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_replactment/replacment_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_apply_leave/apply_leave_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_submit_aproroval_gs/submit_aproroval_gs_bloc.dart';
import 'package:hcm1011/presentasion/bloc/blov_type_leave/type_leave_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_submit_gs/submit_gs_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_delete_gs/delete_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_list/list_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_Detail/detail_info_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_list_info/list_info_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_leave/leave_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_kpi/kpi_bloc.dart';
import 'package:hcm1011/presentasion/cubit/home_cubit.dart';
import 'package:hcm1011/presentasion/bloc/bloc_my_trining/my_training_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_story/bloc_list_story_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_goal_setting/goal_setting_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_creade_GS/cread_data_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_satuan/bloc_satuan_bloc.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerFactory<MyTrining>(
    () => MyTrining(),
  );
  getIt.registerFactory<GoalSettingList>(
    () => GoalSettingList(),
  );
  getIt.registerFactory<ListStory>(
    () => ListStory(),
  );
  getIt.registerFactory<ListInfoBanner>(
    () => ListInfoBanner(),
  );
  getIt.registerFactory<KpiDetail>(
    () => KpiDetail(),
  );
  getIt.registerFactory<ListInfo>(
    () => ListInfo(),
  );
  getIt.registerFactory<DetailInfo>(
    () => DetailInfo(),
  );
  getIt.registerFactory<ListLeave>(
    () => ListLeave(),
  );
  getIt.registerFactory<HomeIndexCubit>(
    () => HomeIndexCubit(),
  );
  getIt.registerFactory<CreateGs>(
    () => CreateGs(),
  );
  getIt.registerFactory<ListSatuanList>(
    () => ListSatuanList(),
  );
  getIt.registerFactory<DeleteGs>(
    () => DeleteGs(),
  );
  getIt.registerFactory<SubmitGs>(
    () => SubmitGs(),
  );
  getIt.registerFactory<SaldoData>(
    () => SaldoData(),
  );
  getIt.registerFactory<TransaksiRoomType>(
    () => TransaksiRoomType(),
  );

  getIt.registerFactory<SalfSubmitApprovalGs>(
    () => SalfSubmitApprovalGs(),
  );
  getIt.registerFactory<TypeLeaveListapi>(
    () => TypeLeaveListapi(),
  );
  getIt.registerFactory<ApplyLeave>(
    () => ApplyLeave(),
  );
  getIt.registerFactory<NotificationList>(
    () => NotificationList(),
  );
  getIt.registerFactory<EmployeeReplacementapi>(
    () => EmployeeReplacementapi(),
  );
  getIt.registerFactory<Auth>(
    () => Auth(),
  );
  getIt.registerFactory<BookingList>(
    () => BookingList(),
  );
  getIt.registerFactory<TypeRoomListapi>(
    () => TypeRoomListapi(),
  );
  getIt.registerFactory<ApplyRoomApi>(
    () => ApplyRoomApi(),
  );
  getIt.registerFactory<ListBookingApi>(
    () => ListBookingApi(),
  );
  getIt.registerFactory<addTrining>(
    () => addTrining(),
  );
  getIt.registerFactory<ApplyCarBooking>(
    () => ApplyCarBooking(),
  );

  getIt.registerFactory<ApiScheduleTrining>(
    () => ApiScheduleTrining(),
  );

  getIt.registerFactory<readNotification>(
    () => readNotification(),
  );

  getIt.registerFactory<ApiEditGs>(
    (() => ApiEditGs()),
  );

  getIt.registerFactory<UpdateGs>(
    (() => UpdateGs()),
  );

  getIt.registerFactory<ApplyCarApi>(
    (() => ApplyCarApi()),
  );

  getIt.registerFactory<ListCarType>(
    (() => ListCarType()),
  );

  getIt.registerFactory<DeleteStoryList>(
    () => DeleteStoryList(),
  );
  getIt.registerFactory<ApiDeleteBookingRoom>(
    () => ApiDeleteBookingRoom(),
  );

  getIt.registerFactory<EditKpiBloc>(
    () => EditKpiBloc(
      apiEditKpi: getIt(),
    ),
  );

  getIt.registerFactory<DeleteBookingRoomBloc>(
    () => DeleteBookingRoomBloc(
      dalateGs: getIt(),
    ),
  );

  getIt.registerFactory<DelateStoryBloc>(
    () => DelateStoryBloc(
      apiDeleteStory: getIt(),
    ),
  );

  getIt.registerFactory<CarTypeBloc>(
    () => CarTypeBloc(
      apiCarType: getIt(),
    ),
  );

  getIt.registerFactory<ApplyTrainingBloc>(
    () => ApplyTrainingBloc(
      apiTraining: getIt(),
    ),
  );

  getIt.registerFactory<BookingBackapplyBloc>(
    () => BookingBackapplyBloc(
      apiBackTraining: getIt(),
    ),
  );

  getIt.registerFactory<UpdateGoalSettingBloc>(
    () => UpdateGoalSettingBloc(
      apiUpdateGS: getIt(),
    ),
  );

  getIt.registerFactory<FormDetailIdBloc>(
    () => FormDetailIdBloc(
      apiEditGS: getIt(),
    ),
  );

  getIt.registerFactory<ReadNotificationBloc>(
    () => ReadNotificationBloc(
      apiReadNotif: getIt(),
    ),
  );
  getIt.registerFactory<BookingListBloc>(
    () => BookingListBloc(
      ApiBooking: getIt(),
    ),
  );

  getIt.registerFactory<BookingCarBloc>(
    () => BookingCarBloc(
      ApplyCarBookingapi: getIt(),
    ),
  );

  getIt.registerFactory<SchaduleListBloc>(
    () => SchaduleListBloc(
      apiScheduleTrining: getIt(),
    ),
  );

  getIt.registerFactory<BalanceBloc>(
    () => BalanceBloc(
      ApiSaldo: getIt(),
    ),
  );
  getIt.registerFactory<TransaksiBookingBloc>(
    () => TransaksiBookingBloc(
      apiBookingList: getIt(),
    ),
  );
  getIt.registerFactory<NotificationBloc>(
    () => NotificationBloc(
      ApiNotification: getIt(),
    ),
  );
  getIt.registerFactory<RoomTypeBloc>(
    () => RoomTypeBloc(
      apiTypeofroom: getIt(),
    ),
  );
  getIt.registerFactory<BookingBloc>(
    () => BookingBloc(
      apiBookingList: getIt(),
    ),
  );
  getIt.registerFactory<AuthLoginBloc>(
    () => AuthLoginBloc(
      getIt(),
    ),
  );
  getIt.registerFactory<ReplacmentBloc>(
    () => ReplacmentBloc(
      apiReplacment: getIt(),
    ),
  );
  getIt.registerFactory<ApplyLeaveBloc>(
    () => ApplyLeaveBloc(
      ApplyLeaveapi: getIt(),
    ),
  );
  getIt.registerFactory<SubmitAprovalGsBloc>(
    () => SubmitAprovalGsBloc(
      apiSubmit: getIt(),
    ),
  );
  getIt.registerFactory<SubmitGsBloc>(
    () => SubmitGsBloc(
      apiSubmit: getIt(),
    ),
  );
  getIt.registerFactory<TypeLeaveBloc>(
    () => TypeLeaveBloc(
      apiTypeofleave: getIt(),
    ),
  );
  getIt.registerFactory<ApplyBookingBloc>(
    () => ApplyBookingBloc(
      ApplyRoomapi: getIt(),
    ),
  );
  getIt.registerFactory<DeleteDataBloc>((() => DeleteDataBloc(
        apiDeleteGS: getIt(),
      )));

  getIt.registerFactory<BlocSatuanBloc>(() => BlocSatuanBloc(
        apiSatuanKpi: getIt(),
      ));
  getIt.registerFactory<CreadDataBloc>(
    () => CreadDataBloc(
      apiCreateGS: getIt(),
    ),
  );
  getIt.registerFactory<ListBloc>(
    () => ListBloc(
      apiListInfo: getIt(),
    ),
  );
  getIt.registerFactory<KpiBloc>(
    () => KpiBloc(
      apiDetailKpi: getIt(),
    ),
  );
  getIt.registerFactory<ListInfoBloc>(
    () => ListInfoBloc(
      apiinfo: getIt(),
    ),
  );
  getIt.registerFactory(
    () => BlocListStoryBloc(
      listStory: getIt(),
    ),
  );
  getIt.registerFactory<DetailInfoBloc>(
    () => DetailInfoBloc(
      apiDetailInfo: getIt(),
    ),
  );
  getIt.registerFactory<LeaveBloc>(
    () => LeaveBloc(
      apiListLeave: getIt(),
    ),
  );
  getIt.registerFactory<MyTrainingBloc>(
    () => MyTrainingBloc(
      apiMyTrining: getIt(),
    ),
  );
  getIt.registerFactory<GoalSettingBloc>(
    () => GoalSettingBloc(
      apiGoalSetting: getIt(),
    ),
  );
}
