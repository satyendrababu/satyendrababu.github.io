import 'package:flutter/material.dart';
import 'package:simple_ehr/data/model/base/api_response.dart';
import 'package:simple_ehr/data/model/response/login_response.dart';
import 'package:simple_ehr/data/model/response/response_model.dart';
import 'package:simple_ehr/data/repository/auth_repo.dart';

import '../helper/api_checker.dart';

class AuthProvider with ChangeNotifier {
  final AuthRepo? authRepo;

  AuthProvider({required this.authRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set setIsLoading(bool value)=> _isLoading = value;
  // for login section
  String? _loginErrorMessage = '';

  String? get loginErrorMessage => _loginErrorMessage;



  Future<ResponseModel> login(String? email, String? password) async {
    _isLoading = true;
    _loginErrorMessage = '';
    notifyListeners();
    ApiResponse apiResponse = await authRepo!.login(email: email, password: password);
    ResponseModel responseModel;
    String? accessToken;
    String? refreshToken;
    if(apiResponse.response != null && apiResponse.response!.statusCode == 200) {

      LoginResponse loginResponse = LoginResponse.fromJson(apiResponse.response!.data);

      if (loginResponse.data != null) {

        accessToken = loginResponse.data!.accessToken;
        refreshToken = loginResponse.data!.refreshToken;

        // Do something with tokens if necessary
        debugPrint('Access Token: $accessToken');
        debugPrint('Refresh Token: $refreshToken');
      }
      if(accessToken != null) {
        authRepo!.saveUserToken(accessToken);
      }
      responseModel = ResponseModel(accessToken != null, 'verification');

    } else {
      _loginErrorMessage = ApiChecker.getError(apiResponse).errors![0].message;
      responseModel = ResponseModel(false, _loginErrorMessage);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }
  bool isLoggedIn() {
    return authRepo!.isLoggedIn();
  }

  Future<ResponseModel> forgetPassword(String? email) async {
    _isLoading = true;
    _loginErrorMessage = '';
    notifyListeners();
    ApiResponse apiResponse = await authRepo!.forgetPassword(email: email);
    ResponseModel responseModel;

    if(apiResponse.response != null && apiResponse.response!.statusCode == 200) {

      responseModel = ResponseModel(apiResponse.response != null, 'verification');

    } else {
      _loginErrorMessage = ApiChecker.getError(apiResponse).errors![0].message;
      responseModel = ResponseModel(false, _loginErrorMessage);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }

}