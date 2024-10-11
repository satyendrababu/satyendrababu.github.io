import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_ehr/data/remote/dio/dio_client.dart';

class SplashRepo {
  final DioClient? dioClient;
  final SharedPreferences? sharedPreferences;
  SplashRepo({required this.sharedPreferences, required this.dioClient});

}