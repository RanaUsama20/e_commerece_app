import 'package:dartz/dartz.dart';
import 'package:flutter_app_e_commerece_online/domain/entities/GetCartResponseEntity.dart';
import 'package:flutter_app_e_commerece_online/domain/entities/failures.dart';

abstract class CartRemoteDataSource {
  Future<Either<Failures, GetCartResponseEntity>> getCart();

  Future<Either<Failures, GetCartResponseEntity>> updateCountInCart(
      String productId,int count);

  Future<Either<Failures, GetCartResponseEntity>> deleteItemInCart(
      String productId);
}
