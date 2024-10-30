import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_ehr/data/local/SharedPrefHelper.dart';

import 'logging_interceptor.dart';

class DioClient {

  final String baseUrl;
  final LoggingInterceptor loggingInterceptor;

  final SharedPreferences sharedPreferences;

  Dio? dio;
  String? token;

  DioClient(this.baseUrl, Dio? dioC, {required this.loggingInterceptor, required this.sharedPreferences}) {
    token = sharedPreferences.getString(SharedPrefHelper.accessToken);
    dio = dioC ?? Dio();
    debugPrint(
        'Token ==>$token}');
    updateHeader(dioC: dioC, getToken: token);
  }

  Future<void> updateHeader({String? getToken, Dio? dioC}) async {
    dio
      ?..options.baseUrl = baseUrl
        ..options.connectTimeout = const Duration(seconds: 30)
        ..options.receiveTimeout = const Duration(seconds: 30)
        ..httpClientAdapter
        ..options.headers = {
          'Content-Type': 'application/json; charset=UTF-8',
          /*'branch-id': '${sharedPreferences.getInt(AppConstants.branch)}',
          'X-localization': sharedPreferences.getString(AppConstants.languageCode)
              ?? AppConstants.languages[0].languageCode,*/
          'Authorization': 'Bearer $getToken',
        };
      dio?.interceptors.add(loggingInterceptor);
  }
  Future<Response> makeGetRequest(String uri, {Map<String, dynamic>? queryParameters}) async {
    try {
      debugPrint(
          'apiCall ==> url=> $uri \nparams---> $queryParameters\nheader=> ${dio!
              .options.headers}');
      var response = await dio!.get(
          uri,
          queryParameters: queryParameters
      );
      debugPrint('Response data: ${response.data}');
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> makePostRequest(String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      debugPrint('apiCall ==> url=> $uri \nparams---> $queryParameters\nheader=> ${dio!.options.headers}');

      FormData? formData;
      if(isFormData && data != null) {
        formData = FormData.fromMap(data);
      }

      var response = await dio!.post(
        uri,
        data: formData ?? data,
        queryParameters: queryParameters
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> makePutRequest(String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    debugPrint('apiCall ==> url=> $uri \nparams---> $queryParameters\nheader=> ${dio!.options.headers}');

    FormData? formData;
    if(isFormData && data != null) {
      formData = FormData.fromMap(data);
    }

    try {
      var response = await dio!.put(
        uri,
        data: formData ?? data,
        queryParameters: queryParameters,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> makeDeleteRequest(String uri, {
    data,
    Map<String, dynamic>? queryParameters
  }) async {
    debugPrint('apiCall ==> url=> $uri \nparams---> $queryParameters\nheader=> ${dio!.options.headers}');

    try {
      var response = await dio!.delete(
        uri,
        data: data,
        queryParameters: queryParameters
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

}