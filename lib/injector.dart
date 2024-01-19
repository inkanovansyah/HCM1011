import 'package:get_it/get_it.dart';
import 'package:hcm1011/data/service/api_service.dart';
import 'package:hcm1011/data/service/api_kpi_detail.dart';
import 'package:hcm1011/data/service/api_list.dart';
import 'package:hcm1011/data/service/api_detail.dart';
import 'package:hcm1011/data/service/api_payroll.dart';
import 'package:hcm1011/data/service/api_leave_list.dart';
import 'package:hcm1011/presentasion/bloc/bloc_list/list_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_Detail/detail_info_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_list_info/list_info_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_leave/leave_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_kpi/kpi_bloc.dart';
import 'package:hcm1011/presentasion/cubit/home_cubit.dart';
import 'package:hcm1011/presentasion/bloc/bloc_payroll/payroll_bloc.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerFactory<ListInfoBanner>(
    () => ListInfoBanner(),
  );
  getIt.registerFactory<KpiDetail>(
    () => KpiDetail(),
  );
  getIt.registerFactory<DetailPayroll>(
    () => DetailPayroll(),
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
  getIt.registerFactory<HomeIndexCubit>(
    () => HomeIndexCubit(),
  );
  getIt.registerFactory<ListInfoBloc>(
    () => ListInfoBloc(
      apiinfo: getIt(),
    ),
  );
  getIt.registerFactory<PayrollBloc>(
    () => PayrollBloc(
      detailPayroll: getIt(),
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
}
