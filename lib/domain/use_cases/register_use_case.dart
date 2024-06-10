import 'package:dartz/dartz.dart';
import 'package:flutter_app_e_commerece_online/data/model/response/RegisterResponseDto.dart';
import 'package:flutter_app_e_commerece_online/data/repository/repository/auth_repository_impl.dart';
import 'package:flutter_app_e_commerece_online/domain/entities/auth_result_entity.dart';
import 'package:flutter_app_e_commerece_online/domain/entities/failures.dart';
import 'package:flutter_app_e_commerece_online/domain/repository/repository/auth_repository_contract.dart';

class RegisterUseCase{
  AuthRepositoryContract repositoryContract ;
  RegisterUseCase({required this.repositoryContract});
  /// register
  Future<Either<Failures,AuthResultEntity>> invoke(String name, String email, String password,
      String rePassword, String phone){
    return repositoryContract.register(name, email, password, rePassword, phone);
  }
}
