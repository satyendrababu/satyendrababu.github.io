/// status : 200
/// success : 1
/// message : "User Logged In successfully."
/// data : {"accessToken":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJhZG1pbkBhZG1pbi5jb20iLCJ1dWlkIjoiYWY0N2UxMDAtNDA1Ni00MjdlLWEwZWItM2ZkM2RlZGIzMGYyIiwiaWF0IjoxNzMwMTE2NDI3LCJleHAiOjE3MzAxMzA4Mjd9.k3_Xpm18h5gx_PXM5SkSGFS18jjqMDS9UUAD1FGGwDM","refreshToken":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJhZG1pbkBhZG1pbi5jb20iLCJ1dWlkIjoiYWY0N2UxMDAtNDA1Ni00MjdlLWEwZWItM2ZkM2RlZGIzMGYyIiwiaWF0IjoxNzMwMTE2NDI3LCJleHAiOjE3MzA3MjEyMjd9.InYV1sVLFR9g4C4zfZ_yI8LGpcpGjdAFFJbKK2DhLXU"}

class LoginResponse {
  LoginResponse({
      num? status, 
      num? success, 
      String? message, 
      Data? data,}){
    _status = status;
    _success = success;
    _message = message;
    _data = data;
}

  LoginResponse.fromJson(dynamic json) {
    _status = json['status'];
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  num? _status;
  num? _success;
  String? _message;
  Data? _data;
LoginResponse copyWith({  num? status,
  num? success,
  String? message,
  Data? data,
}) => LoginResponse(  status: status ?? _status,
  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
);
  num? get status => _status;
  num? get success => _success;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// accessToken : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJhZG1pbkBhZG1pbi5jb20iLCJ1dWlkIjoiYWY0N2UxMDAtNDA1Ni00MjdlLWEwZWItM2ZkM2RlZGIzMGYyIiwiaWF0IjoxNzMwMTE2NDI3LCJleHAiOjE3MzAxMzA4Mjd9.k3_Xpm18h5gx_PXM5SkSGFS18jjqMDS9UUAD1FGGwDM"
/// refreshToken : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJhZG1pbkBhZG1pbi5jb20iLCJ1dWlkIjoiYWY0N2UxMDAtNDA1Ni00MjdlLWEwZWItM2ZkM2RlZGIzMGYyIiwiaWF0IjoxNzMwMTE2NDI3LCJleHAiOjE3MzA3MjEyMjd9.InYV1sVLFR9g4C4zfZ_yI8LGpcpGjdAFFJbKK2DhLXU"

class Data {
  Data({
      String? accessToken, 
      String? refreshToken,}){
    _accessToken = accessToken;
    _refreshToken = refreshToken;
}

  Data.fromJson(dynamic json) {
    _accessToken = json['accessToken'];
    _refreshToken = json['refreshToken'];
  }
  String? _accessToken;
  String? _refreshToken;
Data copyWith({  String? accessToken,
  String? refreshToken,
}) => Data(  accessToken: accessToken ?? _accessToken,
  refreshToken: refreshToken ?? _refreshToken,
);
  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['accessToken'] = _accessToken;
    map['refreshToken'] = _refreshToken;
    return map;
  }

}