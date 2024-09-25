import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../app_exception.dart';
import 'base_api_service.dart';


class NetworkApiService extends BaseApiService {

  @override
  Future makeGetTypeApiRequest(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(baseUrl + url));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }


  @override
  Future makePostTypeApiRequest(String url, dynamic data) async {
    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(baseUrl + url),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(data));
      responseJson = returnResponse(response);

    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }
  @override
  Future makeGetRequest(String? url, String? userId, String? token) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse('$baseUrl$url$userId'),
          headers: {
          'Content-Type': 'application/json',
            'Authorization' : 'Bearer $token'
          });
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future makeGetRequestToDeleteMedicine(String? url, String? visitId, String? medicineId, String? token) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse('$baseUrl$url$visitId/$medicineId'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization' : 'Bearer $token'
          });
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }



  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
}
