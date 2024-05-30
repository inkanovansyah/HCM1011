// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hcm1011/presentasion/bloc/bloc_list/list_bloc.dart';
import 'package:hcm1011/presentasion/cubit/home_cubit.dart';
import 'package:hcm1011/presentasion/bloc/bloc_list_info/list_info_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_Detail/detail_info_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_leave/leave_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_kpi/kpi_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_payroll/payroll_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_my_trining/my_training_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_story/bloc_list_story_bloc.dart';

import 'package:hcm1011/presentasion/pages/splashscreen.dart';
import 'package:hcm1011/presentasion/pages/info_detail.dart';
import 'package:hcm1011/presentasion/pages/login.dart';

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
        BlocProvider(create: (_) => di.getIt<PayrollBloc>()),
        BlocProvider(create: (_) => di.getIt<MyTrainingBloc>()),
        BlocProvider(create: (_) => di.getIt<BlocListStoryBloc>()),
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
          // SplashScreen.route: (context) {
          //   SharedPreferencesUtil.checkFirstTimeAndNavigate(context);
          //   return const SplashScreen();
          // },
          // Login.route: (context) {
          //   SharedPreferencesUtil.checkFirstTimeAndNavigate(context);
          //   return Login();
          // },
          SplashScreen.route: (_) => const SplashScreen(),
          Login.route: (context) => Login(),
          infoDetail.route: (context) => infoDetail(
                argument: ModalRoute.of(context)!.settings.arguments
                    as DetailPageArgument,
              ),
        },
      ),
    );
  }
}
