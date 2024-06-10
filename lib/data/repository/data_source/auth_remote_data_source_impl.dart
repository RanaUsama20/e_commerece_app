import 'package:dartz/dartz.dart';
import 'package:flutter_app_e_commerece_online/data/api/api_manager.dart';
import 'package:flutter_app_e_commerece_online/data/model/response/RegisterResponseDto.dart';
import 'package:flutter_app_e_commerece_online/domain/entities/auth_result_entity.dart';
import 'package:flutter_app_e_commerece_online/domain/entities/failures.dart';
import 'package:flutter_app_e_commerece_online/domain/repository/data_source/auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  ApiManager apiManager ;
  AuthRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures,AuthResultEntity>> register(String name, String email,
      String password, String rePassword, String phone) async{
    var either = await apiManager.register(name, email, password, rePassword, phone);
    return either.fold((l) {
      return Left(Failures(errorMessage: l.errorMessage));
    },
            (response) {
      return Right(response.toAuthResultEntity());
            });
  }

  @override
  Future<Either<Failures, AuthResultEntity>> login(String email, String password)async {
    var either = await apiManager.login(email, password);
    return either.fold((l) {
      return Left(Failures(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response.toAuthResultEntity());
    });
  }
}
