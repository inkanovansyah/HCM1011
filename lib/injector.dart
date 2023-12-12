import 'package:get_it/get_it.dart';
import 'package:hcm1011/data/service/api_service.dart';
import 'package:hcm1011/data/service/api_list.dart';
import 'package:hcm1011/data/service/api_detail.dart';
import 'package:hcm1011/presentasion/bloc/bloc_list/list_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_Detail/detail_info_bloc.dart';
import 'package:hcm1011/presentasion/bloc/bloc_list_info/list_info_bloc.dart';
import 'package:hcm1011/presentasion/cubit/home_cubit.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerFactory<ListInfoBanner>(
    () => ListInfoBanner(),
  );

  getIt.registerFactory<ListInfo>(
    () => ListInfo(),
  );
  getIt.registerFactory<DetailInfo>(
    () => DetailInfo(),
  );
  getIt.registerFactory<ListBloc>(
    () => ListBloc(
      apiListInfo: getIt(),
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
  getIt.registerFactory<DetailInfoBloc>(
    () => DetailInfoBloc(
      apiDetailInfo: getIt(),
    ),
  );
}
