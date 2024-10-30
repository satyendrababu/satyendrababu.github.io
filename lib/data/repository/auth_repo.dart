import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_ehr/data/datasource/remote/dio/dio_client.dart';
import 'package:simple_ehr/data/datasource/remote/api_end_points.dart';

import '../../utils/app_constants.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/base/api_response.dart';



class AuthRepo {

  final DioClient? dioClient;
  final SharedPreferences? sharedPreferences;

  AuthRepo({required this.dioClient, required this.sharedPreferences});

  Future<ApiResponse> login({String? email, String? password}) async {
    try {
      Response response = await dioClient!.makePostRequest(
        ApiEndPoints.login,
        data: {"email": email, "password": password}
      );
      debugPrint('Response--> $response');
      return ApiResponse.withSuccess(response);
    }catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  /*Future<LoginResponse> login({String? email, String? password}) async {
    try {
      Response response = await dioClient!.makePostRequest(
          ApiEndPoints.login,
          data: {"email": email, "password": password}
      );
      // Check if response status code is successful
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Parse the response data into LoginResponse
        return LoginResponse.fromJson(response.data);
      } else {
        // Handle other status codes (e.g., 400, 500) as needed
        throw Exception('Failed to login, status code: ${response.statusCode}');
      }
    }catch (e) {
      //return ApiResponse.error(ApiErrorHandler.getMessage(e));
      rethrow;
    }
  }*/
  // for  user token
  Future<void> saveUserToken(String token) async {
    dioClient!.updateHeader(getToken: token);
    try {
      await sharedPreferences!.setString(AppConstants.token, token);
    } catch (e) {
      rethrow;
    }
  }
  String getUserToken() {
    return sharedPreferences!.getString(AppConstants.token) ?? "";
  }

  bool isLoggedIn() {
    return sharedPreferences!.containsKey(AppConstants.token);
  }

  Future<ApiResponse> forgetPassword({String? email}) async {
    try {
      Response response = await dioClient!.makePostRequest(
          ApiEndPoints.login,
          data: {"email": email},
          isFormData: true
      );
      debugPrint('Response--> $response');
      return ApiResponse.withSuccess(response);
    }catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

}