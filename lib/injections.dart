

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:slash_task/core/api/dio_helper.dart';
import 'package:slash_task/features/home/data/repos/home_repo.dart';
import 'package:slash_task/features/home/data/repos/home_repo_impl.dart';
import 'package:slash_task/features/home/presentation/cubit/home_cubit.dart';

final s1 = GetIt.instance;

void setupServiceLocator()
{
  s1.registerLazySingleton(() => AppCubit(homeRepo: s1(),),);

  s1.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(dioHelper: s1()),);

  s1.registerLazySingleton(() => DioHelper(dio: s1()),);

  s1.registerLazySingleton(() => Dio());
}