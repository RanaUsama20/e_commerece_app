import 'package:dartz/dartz.dart';
import 'package:flutter_app_e_commerece_online/domain/entities/GetCartResponseEntity.dart';
import 'package:flutter_app_e_commerece_online/domain/entities/failures.dart';
import 'package:flutter_app_e_commerece_online/domain/repository/repository/cart_repository_contract.dart';

class DeleteItemInCartUseCase{
  CartRepositoryContract repositoryContract ;
  DeleteItemInCartUseCase({required this.repositoryContract});

  Future<Either<Failures, GetCartResponseEntity>> invoke(String productId){
    return repositoryContract.deleteItemInCart(productId);
  }
}