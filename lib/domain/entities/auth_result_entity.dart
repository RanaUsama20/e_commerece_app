import 'package:flutter_app_e_commerece_online/domain/entities/UserEntity.dart';

class AuthResultEntity{
  UserEntity? userEntity ;
  String? token ;
  AuthResultEntity({this.userEntity,this.token});
}