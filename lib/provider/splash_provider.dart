import 'package:flutter/material.dart';
import 'package:simple_ehr/data/model/base/api_response.dart';

import '../data/repository/splash_repo.dart';

class SplashProvider extends ChangeNotifier {

  final SplashRepo? splashRepo;
  SplashProvider({required this.splashRepo});


  Future<bool> initConfig() async {
    ApiResponse apiResponse = await splashRepo!.getConfig();
    bool isSuccess;
    if(apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      isSuccess = true;
    }else {
      isSuccess = false;
    }
    print('Response:--------$isSuccess');
    return isSuccess;
  }
}