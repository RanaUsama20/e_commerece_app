import 'package:flutter_app_e_commerece_online/data/model/response/UserDto.dart';
import 'package:flutter_app_e_commerece_online/domain/entities/auth_result_entity.dart';

/// message : "success"
/// user : {"name":"Rana","email":"rana15@route.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1NDE0OGFkODNiMGVlYmVkY2UzN2I0NCIsIm5hbWUiOiJSYW5hIiwicm9sZSI6InVzZXIiLCJpYXQiOjE2OTg3Nzc0ODIsImV4cCI6MTcwNjU1MzQ4Mn0.S6de18JsxqjUw5A7gK5jqce8BXStM4P28hzHyRrj9Qg"

class LoginResponseDto {
  LoginResponseDto({
      this.message, 
      this.user,
    this.statusMsg,
      this.token,});

  LoginResponseDto.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
    statusMsg = json['statusMsg'];
  }
  String? message;
  UserDto? user;
  String? token;
  String? statusMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }
  AuthResultEntity toAuthResultEntity(){
    return AuthResultEntity(
        userEntity: user?.toUserEntity(),
        token: token
    );
  }
}
