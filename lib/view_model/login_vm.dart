

import 'package:flutter/material.dart';
import '../data/datasource/remote/response/api_response.dart';
import '../model/login_response.dart';
import '../repository/sign_in/login_repo_imp.dart';

class LoginVM extends ChangeNotifier {

  final _myRepo = LoginRepoImp();
  ApiResponse<LoginResponse> loginData = ApiResponse.loading();

  void _setLoginData(ApiResponse<LoginResponse> response){
    loginData = response;
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    _setLoginData(ApiResponse.loading());
    _myRepo.login(email, password)
    .then((value) => _setLoginData(ApiResponse.completed(value)))
    .onError((error, stackTrace) => _setLoginData(ApiResponse.error(error.toString())));
  }

}