import 'package:dartz/dartz.dart';
import 'package:flutter_app_e_commerece_online/data/model/response/RegisterResponseDto.dart';
import 'package:flutter_app_e_commerece_online/data/repository/data_source/auth_remote_data_source_impl.dart';
import 'package:flutter_app_e_commerece_online/domain/entities/auth_result_entity.dart';
import 'package:flutter_app_e_commerece_online/domain/entities/failures.dart';
import 'package:flutter_app_e_commerece_online/domain/repository/data_source/auth_remote_data_source.dart';
import 'package:flutter_app_e_commerece_online/domain/repository/repository/auth_repository_contract.dart';

class AuthRepositoryImpl implements AuthRepositoryContract{
  AuthRemoteDataSource remoteDataSource ;
  AuthRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failures,AuthResultEntity>> register(String name, String email, String password, String rePassword, String phone) {
    return remoteDataSource.register(name, email, password, rePassword, phone);
  }

  @override
  Future<Either<Failures, AuthResultEntity>> login(String email, String password) {
    return remoteDataSource.login(email, password);
  }

}
