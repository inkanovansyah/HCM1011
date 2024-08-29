// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hcm1011/presentasion/bloc/bloc_satuan/bloc_satuan_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_list/list_bloc.dart';
import 'package:hcm1011/presentasion/cubit/home_cubit.dart';
import 'package:hcm1011/presentasion/bloc/bloc_list_info/list_info_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_Detail/detail_info_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_leave/leave_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_kpi/kpi_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_my_trining/my_training_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_story/bloc_list_story_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_goal_setting/goal_setting_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_creade_GS/cread_data_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_delete_gs/delete_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_submit_gs/submit_gs_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_submit_aproroval_gs/submit_aproroval_gs_bloc.dart';
import 'package:hcm1011/presentasion/bloc/blov_type_leave/type_leave_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_apply_leave/apply_leave_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_replactment/replacment_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_auth/auth_login_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_notification/notification_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_boocking/booking_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_booking_list/booking_list_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_type_room/room_type_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_apply_booking/apply_booking_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_balance/balance_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_read_notification/read_notification_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_achadule_list/schadule_list_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_booking_car/booking_car_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_transaksi_booking/transaksi_booking_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_apply_traning/apply_training_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_form_detail_id/form_detail_id_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_update_goal_setting/update_goal_setting_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_booking_backapply/booking_backapply_bloc.dart';
import 'package:hcm1011/presentasion/pages/splashscreen.dart';
import 'package:hcm1011/presentasion/pages/info_detail.dart';
import 'package:hcm1011/presentasion/pages/login.dart';
import 'package:hcm1011/presentasion/pages/form_goal_setting_edit.dart';

import 'package:hcm1011/utils/utils.dart';
import 'injector.dart' as di;
// import 'package:hcm1011/utils/splashscreen.dart';
// import 'injector.dart' as di;

void main() async {
  await di.setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.getIt<ListBloc>()),
        BlocProvider(create: (_) => di.getIt<ListInfoBloc>()),
        BlocProvider(create: (_) => di.getIt<HomeIndexCubit>()),
        BlocProvider(create: (_) => di.getIt<DetailInfoBloc>()),
        BlocProvider(create: (_) => di.getIt<LeaveBloc>()),
        BlocProvider(create: (_) => di.getIt<KpiBloc>()),
        BlocProvider(create: (_) => di.getIt<MyTrainingBloc>()),
        BlocProvider(create: (_) => di.getIt<BlocListStoryBloc>()),
        BlocProvider(create: (_) => di.getIt<GoalSettingBloc>()),
        BlocProvider(create: (_) => di.getIt<CreadDataBloc>()),
        BlocProvider(create: (_) => di.getIt<BlocSatuanBloc>()),
        BlocProvider(create: (_) => di.getIt<CreadDataBloc>()),
        BlocProvider(create: (_) => di.getIt<DeleteDataBloc>()),
        BlocProvider(create: (_) => di.getIt<SubmitGsBloc>()),
        BlocProvider(create: (_) => di.getIt<SubmitAprovalGsBloc>()),
        BlocProvider(create: (_) => di.getIt<TypeLeaveBloc>()),
        BlocProvider(create: (_) => di.getIt<ApplyLeaveBloc>()),
        BlocProvider(create: (_) => di.getIt<ReplacmentBloc>()),
        BlocProvider(create: (_) => di.getIt<AuthLoginBloc>()),
        BlocProvider(create: (_) => di.getIt<BookingBloc>()),
        BlocProvider(create: (_) => di.getIt<RoomTypeBloc>()),
        BlocProvider(create: (_) => di.getIt<ApplyBookingBloc>()),
        BlocProvider(create: (_) => di.getIt<BookingListBloc>()),
        BlocProvider(create: (_) => di.getIt<NotificationBloc>()),
        BlocProvider(create: (_) => di.getIt<BalanceBloc>()),
        BlocProvider(create: (_) => di.getIt<TransaksiBookingBloc>()),
        BlocProvider(create: (_) => di.getIt<BookingCarBloc>()),
        BlocProvider(create: (_) => di.getIt<SchaduleListBloc>()),
        BlocProvider(create: (_) => di.getIt<ApplyTrainingBloc>()),
        BlocProvider(create: (_) => di.getIt<ReadNotificationBloc>()),
        BlocProvider(create: (_) => di.getIt<FormDetailIdBloc>()),
        BlocProvider(create: (_) => di.getIt<UpdateGoalSettingBloc>()),
        BlocProvider(create: (_) => di.getIt<BookingBackapplyBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: SplashScreen(),
        theme: ThemeData(
          fontFamily: 'GoogleSans',
          scaffoldBackgroundColor: Colors.white,
        ),
        navigatorObservers: [
          routeObserver,
        ],
        initialRoute: SplashScreen.route,
        routes: {
          SplashScreen.route: (_) => const SplashScreen(),
          Login.route: (context) => Login(),
          infoDetail.route: (context) => infoDetail(
                argument: ModalRoute.of(context)!.settings.arguments
                    as DetailPageArgument,
              ),
          infoDetailFrom.route: (context) => infoDetailFrom(
                argumentFromDetail: ModalRoute.of(context)!.settings.arguments
                    as EditFormPageArgument,
              ),
        },
      ),
    );
  }
}
