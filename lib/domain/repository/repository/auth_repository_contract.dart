import 'package:dartz/dartz.dart';
import 'package:flutter_app_e_commerece_online/domain/entities/auth_result_entity.dart';
import 'package:flutter_app_e_commerece_online/domain/entities/failures.dart';

abstract class AuthRepositoryContract {
  Future<Either<Failures, AuthResultEntity>> register(String name, String email,
      String password, String rePassword, String phone);

  Future<Either<Failures, AuthResultEntity>> login(
      String email, String password);
}
