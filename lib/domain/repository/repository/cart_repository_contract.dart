import 'package:dartz/dartz.dart';
import 'package:flutter_app_e_commerece_online/domain/entities/GetCartResponseEntity.dart';
import 'package:flutter_app_e_commerece_online/domain/entities/failures.dart';

abstract class CartRepositoryContract{
  Future<Either<Failures,GetCartResponseEntity>> getCart();
  Future<Either<Failures,GetCartResponseEntity>> deleteItemInCart(String productId);
  Future<Either<Failures,GetCartResponseEntity>> updateCountInCart(
      String productId,int count);
}