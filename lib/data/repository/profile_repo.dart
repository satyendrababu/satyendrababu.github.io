import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_ehr/data/datasource/remote/api_end_points.dart';

import '../../utils/app_constants.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/base/api_response.dart';

class ProfileRepo {
  final DioClient? dioClient;
  final SharedPreferences? sharedPreferences;

  ProfileRepo({required this.dioClient, required this.sharedPreferences});



  Future<ApiResponse> getUserInfo() async {
    try {
      final response = await dioClient!.makeGetRequest(ApiEndPoints.userDetails);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> updateUserInfo(dynamic mapData) async {
    try {
      final response = await dioClient!.makePutRequest(ApiEndPoints.updateUserDetails,data: mapData, isFormData: true);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> changePassword(dynamic mapData) async {
    try {
      final response = await dioClient!.makePutRequest(ApiEndPoints.changePassword,data: mapData, isFormData: true);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> logout() async {
    try {
      final response = await dioClient!.makePostRequest(ApiEndPoints.logout);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<bool> clearSharedData() async {
    await sharedPreferences!.remove(AppConstants.token);
    return true;
  }
}