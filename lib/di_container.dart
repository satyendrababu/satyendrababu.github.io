import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_ehr/data/repository/splash_repo.dart';
import 'package:simple_ehr/provider/splash_provider.dart';

import 'data/datasource/remote/dio/dio_client.dart';
import 'data/datasource/remote/dio/logging_interceptor.dart';

final sl = GetIt.instance;

Future<void> init() async {

  sl.registerLazySingleton(() => DioClient('https://cat-fact.herokuapp.com/', sl(), loggingInterceptor: sl(), sharedPreferences: sl()));
  
  //Repository
  sl.registerLazySingleton(() => SplashRepo(sharedPreferences: sl(), dioClient: sl()));
  
  //Providers
  sl.registerLazySingleton(() => SplashProvider(splashRepo: sl()));

  //External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
}