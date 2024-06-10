
import 'package:dartz/dartz.dart';

import 'package:flutter_app_e_commerece_online/domain/entities/GetCartResponseEntity.dart';

import 'package:flutter_app_e_commerece_online/domain/entities/failures.dart';
import 'package:flutter_app_e_commerece_online/domain/repository/data_source/cart_remote_data_source.dart';

import '../../../domain/repository/repository/cart_repository_contract.dart';

class CartRepositoryImpl implements CartRepositoryContract{
  CartRemoteDataSource cartRemoteDataSource ;
  CartRepositoryImpl({required this.cartRemoteDataSource});
  @override
  Future<Either<Failures, GetCartResponseEntity>> getCart() {
   return cartRemoteDataSource.getCart();
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> deleteItemInCart(String productId) {
   return cartRemoteDataSource.deleteItemInCart(productId);
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> updateCountInCart(
      String productId,int count) {
    return cartRemoteDataSource.updateCountInCart(productId,count);
  }

}