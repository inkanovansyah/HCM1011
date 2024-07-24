import 'package:get_it/get_it.dart';
import 'package:hcm1011/data/service/api_service.dart';
import 'package:hcm1011/data/service/api_kpi_detail.dart';
import 'package:hcm1011/data/service/api_list.dart';
import 'package:hcm1011/data/service/api_detail.dart';
import 'package:hcm1011/data/service/api_payroll.dart';
import 'package:hcm1011/data/service/api_leave_list.dart';
import 'package:hcm1011/data/service/api_list_story.dart';
import 'package:hcm1011/data/service/api_goal_seting.dart';
import 'package:hcm1011/data/service/api_creat_gs.dart';
import 'package:hcm1011/data/service/api_satuan_kpi.dart';
import 'package:hcm1011/data/service/my-trening.dart';
import 'package:hcm1011/data/service/apI_dalate_gs_.dart';
import 'package:hcm1011/data/service/api_submit.dart';
import 'package:hcm1011/data/service/api_salf_submit_approval_gs.dart';
import 'package:hcm1011/presentasion/bloc/bloc_submit_aproroval_gs/submit_aproroval_gs_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_submit_gs/submit_gs_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_delete_gs/delete_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_list/list_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_Detail/detail_info_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_list_info/list_info_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_leave/leave_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_kpi/kpi_bloc.dart';
import 'package:hcm1011/presentasion/cubit/home_cubit.dart';
import 'package:hcm1011/presentasion/bloc/bloc_payroll/payroll_bloc.dart';
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
  getIt.registerFactory<SalfSubmitApprovalGs>(
    () => SalfSubmitApprovalGs(),
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
