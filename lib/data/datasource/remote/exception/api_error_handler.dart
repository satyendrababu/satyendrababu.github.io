import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../../helper/app_mode.dart';
import '../../../model/base/error_response.dart';


class ApiErrorHandler {
  static dynamic getMessage(error) {
    dynamic errorDescription = "";
    if (error is Exception) {
      try {
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              errorDescription = "Request to API server was cancelled";
              break;

            case DioExceptionType.receiveTimeout:
              errorDescription =
              "Receive timeout in connection with API server";
              break;
            case DioExceptionType.badResponse:
              switch (error.response!.statusCode) {
                case 500:
                case 503:
                  errorDescription = error.response!.statusMessage;
                  break;
                default:
                  ErrorResponse? errorResponse;
                  try {
                    errorResponse = ErrorResponse.fromJson(error.response!.data);
                  }catch(e) {
                    if (kDebugMode) {
                      print('error is -> ${e.toString()}');
                    }
                  }

                  if (errorResponse != null && errorResponse.errors != null && errorResponse.errors!.isNotEmpty) {
                    if (kDebugMode) {
                      print('error----------------== ${errorResponse.errors![0].message} || error: ${error.response!.requestOptions.uri}');
                    }
                    errorDescription = errorResponse.toJson();
                  } else {
                    errorDescription =
                    "Failed to load data - status code: ${error.response!.statusCode}";
                  }
              }
              break;
            case DioExceptionType.sendTimeout:
              //errorDescription = getTranslated('send_timeout_with_server', Get.context!);
              errorDescription = 'send_timeout_with_server';
              break;
            case DioExceptionType.connectionTimeout:
              //errorDescription = getTranslated('send_timeout_with_server', Get.context!);
              errorDescription = 'send_timeout_with_server';
              // TODO: Handle this case.
              break;
            case DioExceptionType.badCertificate:
              errorDescription = 'incorrect_certificate';
              // TODO: Handle this case.
              break;
            case DioExceptionType.connectionError:
              //errorDescription = '${getTranslated('unavailable_to_process_data', Get.context!)} ${ AppMode.demo == AppConstants.appMode
              errorDescription = '${'unavailable_to_process_data'} ${ AppMode.demo == 'demo'
                  ? error.response?.requestOptions.path  : error.response!.statusCode}' ;
              // TODO: Handle this case.
              break;
            case DioExceptionType.unknown:
              debugPrint('error----------------== ${error.response?.requestOptions.path} || ${error.response?.statusCode} ${error.response?.data}');

              //errorDescription = getTranslated('unavailable_to_process_data', Get.context!);
              errorDescription = 'unavailable_to_process_data';
              // TODO: Handle this case.
              break;
          }
        } else {
          errorDescription = "Unexpected error occurred";
        }
      } on FormatException catch (e) {
        errorDescription = e.toString();
      }
    } else {
      errorDescription = "is not a subtype of exception";
    }
    return errorDescription;
  }
}
