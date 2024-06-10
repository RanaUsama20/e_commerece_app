import 'package:dartz/dartz.dart';
import 'package:flutter_app_e_commerece_online/domain/entities/ProductResponseEntity.dart';
import 'package:flutter_app_e_commerece_online/domain/entities/failures.dart';
import 'package:flutter_app_e_commerece_online/domain/repository/repository/home_repository_contract.dart';

class GetAllProductsUseCase{
  HomeRepositoryContract repositoryContract ;
  GetAllProductsUseCase({required this.repositoryContract});

  Future<Either<Failures, ProductResponseEntity>> invoke(){
    return repositoryContract.getAllProducts();
  }
}