import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_ehr/helper/router_helper.dart';

import '../data/model/base/api_response.dart';
import '../data/model/base/error_response.dart';
import '../main.dart';
import '../provider/auth_provider.dart';

class ApiChecker {
  static void checkApi(ApiResponse apiResponse,{bool firebaseResponse = false} ) {
    ErrorResponse error = getError(apiResponse);
    if( error.errors![0].code == '401' || error.errors![0].code == 'auth-001'
        && ModalRoute.of(Get.context!)?.settings.name != RouterHelper.loginScreen) {
      /*Provider.of<AuthProvider>(Get.context!, listen: false).clearSharedData(Get.context!).then((value) {
        if(Get.context != null && ModalRoute.of(Get.context!)!.settings.name != RouterHelper.loginScreen) {
          RouterHelper.getLoginRoute(action: RouteAction.pushNamedAndRemoveUntil);
        }
      });*/

    }else {
      //showCustomSnackBar(firebaseResponse ? error.errors?.first.message?.replaceAll('_', ' ').toCapitalized() : error.errors!.first.message);
    }
  }

  static ErrorResponse getError(ApiResponse apiResponse){
    ErrorResponse error;

    try{
      error = ErrorResponse.fromJson(apiResponse);
    }catch(e){
      if(apiResponse.error is String){
        error = ErrorResponse(errors: [Errors(code: '', message: apiResponse.error.toString())]);

      }else{
        error = ErrorResponse.fromJson(apiResponse.error);
      }
    }
    return error;
  }
}