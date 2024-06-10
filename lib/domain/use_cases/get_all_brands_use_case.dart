import 'package:dartz/dartz.dart';
import 'package:flutter_app_e_commerece_online/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:flutter_app_e_commerece_online/domain/entities/failures.dart';
import 'package:flutter_app_e_commerece_online/domain/repository/repository/home_repository_contract.dart';

class GetAllBrandsUseCase{
  HomeRepositoryContract repositoryContract ;
  GetAllBrandsUseCase({required this.repositoryContract});

  Future<Either<Failures, CategoryOrBrandResponseEntity>> invoke(){
    return repositoryContract.getAllBrands();
  }
}