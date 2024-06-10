import 'package:flutter_app_e_commerece_online/data/model/response/Error.dart';
import 'package:flutter_app_e_commerece_online/domain/entities/auth_result_entity.dart';
import 'UserDto.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"test20000001@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1M2Q1NzUyNjBhNzMzNzRhYTg2YTNlYSIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjk4NTE4ODY3LCJleHAiOjE3MDYyOTQ4Njd9.n6n_m5VTsn6WH3gkPDdxMJXr4vlpcdH_EAFj8DEQtQk"

class RegisterResponseDto {
  RegisterResponseDto({
      this.message, 
      this.user,
    this.statusMsg,
    this.error,
      this.token,});

  RegisterResponseDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    error = json['errors'] != null ? Error.fromJson(json['errors']) : null;
    token = json['token'];
  }
  String? message;
  UserDto? user;
  String? token;
  String? statusMsg;
  Error? error ;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (error != null) {
      map['errors'] = error?.toJson();
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