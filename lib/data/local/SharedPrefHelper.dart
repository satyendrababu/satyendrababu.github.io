

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static const String fullName = 'fullName';
  static const String email = 'email';
  static const String photo = 'photo';
  static const String password = 'password';
  static const String userId = 'userId';
  static const String accessToken = 'accessToken';
  static const String intro = 'intro';
  static const String login = 'login';

  static const String insuranceName = 'insuranceName';
  static const String policyNumber = 'policyNumber';

  static const String dob = 'dob';
  static const String ssn = 'ssn';
  static const String race = 'race';
  static const String height = 'height';
  static const String weight = 'weight';
  static const String gender = 'gender';
  static const String loginType = 'loginType';


  static Future<void> saveString(String key, String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, data);
  }

  static Future<String> getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? "";
  }

  static Future<void> saveInt(String key, int data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, data);
  }

  static Future<int?> getInt(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  static Future<void> saveBoolean(String key, bool data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, data);
  }

  static Future<bool?> getBoolean(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  static Future<bool> clearSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }

  static Future<void> saveData(String key, String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, data);
  }

  static Future<String?> getData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
  static Future<bool> clearData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }
}
