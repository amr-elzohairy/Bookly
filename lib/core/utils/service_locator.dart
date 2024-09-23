import 'package:bookly/core/utils/api_services.dart';
import 'package:bookly/features/Home/data/repos/home_repo_imple.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServicceLocator() {
  getIt.registerSingleton<ApiServices>(
    ApiServices(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImple>(
    HomeRepoImple(
      getIt.get<ApiServices>(),
    ),
  );
}
