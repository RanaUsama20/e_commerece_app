import 'package:dartz/dartz.dart';
import 'package:flutter_app_e_commerece_online/domain/entities/AddToCartResponseEntity.dart';
import 'package:flutter_app_e_commerece_online/domain/entities/failures.dart';
import 'package:flutter_app_e_commerece_online/domain/repository/repository/home_repository_contract.dart';

class AddToCartUseCase{
  HomeRepositoryContract repositoryContract ;
  AddToCartUseCase({required this.repositoryContract});

  Future<Either<Failures, AddToCartResponseEntity>> invoke(String productId){
    return repositoryContract.addToCart(productId);
  }
}