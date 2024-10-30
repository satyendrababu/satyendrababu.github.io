import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/model/base/api_response.dart';
import '../data/model/response/response_model.dart';
import '../data/model/response/user_info_model.dart';
import '../data/repository/profile_repo.dart';
import '../helper/api_checker.dart';
import 'auth_provider.dart';

class ProfileProvider with ChangeNotifier {
  final ProfileRepo? profileRepo;

  ProfileProvider({required this.profileRepo});

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  String? _loginErrorMessage = '';

  String? get loginErrorMessage => _loginErrorMessage;

  UserInfoModel? _userInfoModel;

  UserInfoModel? get userInfoModel => _userInfoModel;

  set setUserInfoModel(UserInfoModel? user) => _userInfoModel = user;

  Future<void> getUserInfo(bool reload, {bool isUpdate = true}) async {
    _isLoading = true;
    if (reload || _userInfoModel == null) {
      _userInfoModel = null;
    }

    if (_userInfoModel == null) {
      ApiResponse apiResponse = await profileRepo!.getUserInfo();
      if (apiResponse.response != null &&
          apiResponse.response!.statusCode == 200) {
        _userInfoModel = UserInfoModel.fromJson(apiResponse.response!.data);
      } else {
        ApiChecker.checkApi(apiResponse);
      }
    }
    _isLoading = false;
    notifyListeners();
    if (isUpdate) {
      notifyListeners();
    }
  }

  Future<ResponseModel> updateUserInfo(dynamic mapData) async {
    _isLoading = true;
    _loginErrorMessage = '';
    notifyListeners();
    debugPrint('Click Hit=> $mapData');
    ApiResponse apiResponse = await profileRepo!.updateUserInfo(mapData);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      responseModel =
          ResponseModel(apiResponse.response != null, 'verification');
    } else {
      ApiChecker.checkApi(apiResponse);
      responseModel = ResponseModel(false, _loginErrorMessage);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }

  Future<ResponseModel> changePassword(dynamic mapData) async {
    _isLoading = true;
    _loginErrorMessage = '';
    notifyListeners();
    debugPrint('Click Hit=> $mapData');
    ApiResponse apiResponse = await profileRepo!.changePassword(mapData);
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      //_userInfoModel = UserInfoModel.fromJson(apiResponse.response!.data);
      responseModel =
          ResponseModel(apiResponse.response != null, 'verification');
    } else {
      ApiChecker.checkApi(apiResponse);
      responseModel = ResponseModel(false, _loginErrorMessage);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }

  Future<ResponseModel> logout() async {
    _isLoading = true;
    _loginErrorMessage = '';
    notifyListeners();

    ApiResponse apiResponse = await profileRepo!.logout();
    ResponseModel responseModel;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      //_userInfoModel = UserInfoModel.fromJson(apiResponse.response!.data);
      responseModel =
          ResponseModel(apiResponse.response != null, 'verification');

      ///Clear local data */
      await profileRepo!.clearSharedData();
    } else {
      ApiChecker.checkApi(apiResponse);
      responseModel = ResponseModel(false, _loginErrorMessage);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }
}
