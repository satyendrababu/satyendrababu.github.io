/// status : 200
/// success : 1
/// data : {"profile_image":"","id":1,"user_id":1,"first_name":"Admin","last_name":"Appzlogic","phone":"9900123456","gender":"male","created_at":"2024-10-28T07:51:28.000Z","updated_at":"2024-10-29T11:28:46.000Z","user":{"id":1,"email":"admin@admin.com","password":"$2b$10$nUZX0LdjAGOpL.Cj76Ax7.ywvGkbRAdPx9tAS4Ypx/RN1zqV.BL3e","role":"admin","status":"active","created_at":"2024-10-28T07:51:28.000Z","updated_at":"2024-10-28T07:51:28.000Z","deleted_at":null}}

class UserInfoModel {
  UserInfoModel({
      num? status, 
      num? success, 
      Data? data,}){
    _status = status;
    _success = success;
    _data = data;
}

  UserInfoModel.fromJson(dynamic json) {
    _status = json['status'];
    _success = json['success'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  num? _status;
  num? _success;
  Data? _data;
UserInfoModel copyWith({  num? status,
  num? success,
  Data? data,
}) => UserInfoModel(  status: status ?? _status,
  success: success ?? _success,
  data: data ?? _data,
);
  num? get status => _status;
  num? get success => _success;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// profile_image : ""
/// id : 1
/// user_id : 1
/// first_name : "Admin"
/// last_name : "Appzlogic"
/// phone : "9900123456"
/// gender : "male"
/// created_at : "2024-10-28T07:51:28.000Z"
/// updated_at : "2024-10-29T11:28:46.000Z"
/// user : {"id":1,"email":"admin@admin.com","password":"$2b$10$nUZX0LdjAGOpL.Cj76Ax7.ywvGkbRAdPx9tAS4Ypx/RN1zqV.BL3e","role":"admin","status":"active","created_at":"2024-10-28T07:51:28.000Z","updated_at":"2024-10-28T07:51:28.000Z","deleted_at":null}

class Data {
  Data({
      String? profileImage, 
      num? id, 
      num? userId, 
      String? firstName, 
      String? lastName, 
      String? phone, 
      String? gender, 
      String? createdAt, 
      String? updatedAt, 
      User? user,}){
    _profileImage = profileImage;
    _id = id;
    _userId = userId;
    _firstName = firstName;
    _lastName = lastName;
    _phone = phone;
    _gender = gender;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _user = user;
}

  Data.fromJson(dynamic json) {
    _profileImage = json['profile_image'];
    _id = json['id'];
    _userId = json['user_id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _phone = json['phone'];
    _gender = json['gender'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? _profileImage;
  num? _id;
  num? _userId;
  String? _firstName;
  String? _lastName;
  String? _phone;
  String? _gender;
  String? _createdAt;
  String? _updatedAt;
  User? _user;
Data copyWith({  String? profileImage,
  num? id,
  num? userId,
  String? firstName,
  String? lastName,
  String? phone,
  String? gender,
  String? createdAt,
  String? updatedAt,
  User? user,
}) => Data(  profileImage: profileImage ?? _profileImage,
  id: id ?? _id,
  userId: userId ?? _userId,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  phone: phone ?? _phone,
  gender: gender ?? _gender,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  user: user ?? _user,
);
  String? get profileImage => _profileImage;
  num? get id => _id;
  num? get userId => _userId;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get phone => _phone;
  String? get gender => _gender;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['profile_image'] = _profileImage;
    map['id'] = _id;
    map['user_id'] = _userId;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['phone'] = _phone;
    map['gender'] = _gender;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}

/// id : 1
/// email : "admin@admin.com"
/// password : "$2b$10$nUZX0LdjAGOpL.Cj76Ax7.ywvGkbRAdPx9tAS4Ypx/RN1zqV.BL3e"
/// role : "admin"
/// status : "active"
/// created_at : "2024-10-28T07:51:28.000Z"
/// updated_at : "2024-10-28T07:51:28.000Z"
/// deleted_at : null

class User {
  User({
      num? id, 
      String? email, 
      String? password, 
      String? role, 
      String? status, 
      String? createdAt, 
      String? updatedAt, 
      dynamic deletedAt,}){
    _id = id;
    _email = email;
    _password = password;
    _role = role;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
}

  User.fromJson(dynamic json) {
    _id = json['id'];
    _email = json['email'];
    _password = json['password'];
    _role = json['role'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _deletedAt = json['deleted_at'];
  }
  num? _id;
  String? _email;
  String? _password;
  String? _role;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
  dynamic _deletedAt;
User copyWith({  num? id,
  String? email,
  String? password,
  String? role,
  String? status,
  String? createdAt,
  String? updatedAt,
  dynamic deletedAt,
}) => User(  id: id ?? _id,
  email: email ?? _email,
  password: password ?? _password,
  role: role ?? _role,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  deletedAt: deletedAt ?? _deletedAt,
);
  num? get id => _id;
  String? get email => _email;
  String? get password => _password;
  String? get role => _role;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get deletedAt => _deletedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['email'] = _email;
    map['password'] = _password;
    map['role'] = _role;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['deleted_at'] = _deletedAt;
    return map;
  }

}