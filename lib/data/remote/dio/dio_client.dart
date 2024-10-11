import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_ehr/data/local/SharedPrefHelper.dart';

import 'logging_interceptor.dart';

class DioClient {

  final String baseUrl;
  final LoggingInterceptor loggingInterceptor;

  final SharedPreferences sharedPreferences;

  Dio? dio;
  String? token;

  DioClient(this.baseUrl, Dio? dioC, {required this.loggingInterceptor, required this.sharedPreferences}) {
    token = sharedPreferences.getString(SharedPrefHelper.accessToken);
    dio = dioC ?? Dio();

    updateHeader(dioC: dioC, getToken: token);
  }

  Future<void> updateHeader({String? getToken, Dio? dioC}) async {
    dio
      ?..options.baseUrl = baseUrl
        ..options.connectTimeout = const Duration(seconds: 30)
        ..options.receiveTimeout = const Duration(seconds: 30)
        ..httpClientAdapter
        ..options.headers = {
          'Content-Type': 'application/json; charset=UTF-8',
          /*'branch-id': '${sharedPreferences.getInt(AppConstants.branch)}',
          'X-localization': sharedPreferences.getString(AppConstants.languageCode)
              ?? AppConstants.languages[0].languageCode,*/
          'Authorization': 'Bearer $getToken',
        };
      dio?.interceptors.add(loggingInterceptor);
  }


}