import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_ehr/data/datasource/remote/api_end_points.dart';
import 'package:simple_ehr/data/repository/auth_repo.dart';
import 'package:simple_ehr/data/repository/profile_repo.dart';
import 'package:simple_ehr/data/repository/splash_repo.dart';
import 'package:simple_ehr/provider/auth_provider.dart';
import 'package:simple_ehr/provider/profile_provider.dart';
import 'package:simple_ehr/provider/splash_provider.dart';
import 'package:simple_ehr/utils/app_constants.dart';

import 'data/datasource/remote/dio/dio_client.dart';
import 'data/datasource/remote/dio/logging_interceptor.dart';

final sl = GetIt.instance;

Future<void> init() async {

  sl.registerLazySingleton(() => DioClient(AppConstants.baseUrl, sl(), loggingInterceptor: sl(), sharedPreferences: sl()));
  
  //Repository
  sl.registerLazySingleton(() => SplashRepo(sharedPreferences: sl(), dioClient: sl()));
  sl.registerLazySingleton(() => AuthRepo(sharedPreferences: sl(), dioClient: sl()));
  sl.registerLazySingleton(() => ProfileRepo(sharedPreferences: sl(), dioClient: sl()));

  //Providers
  sl.registerLazySingleton(() => SplashProvider(splashRepo: sl()));
  sl.registerLazySingleton(() => AuthProvider(authRepo: sl()));
  sl.registerLazySingleton(() => ProfileProvider(profileRepo: sl()));

  //External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
}