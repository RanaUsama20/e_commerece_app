import 'package:dartz/dartz.dart';
import 'package:flutter_app_e_commerece_online/data/api/api_manager.dart';
import 'package:flutter_app_e_commerece_online/domain/entities/GetCartResponseEntity.dart';
import 'package:flutter_app_e_commerece_online/domain/entities/failures.dart';
import 'package:flutter_app_e_commerece_online/domain/repository/data_source/cart_remote_data_source.dart';

class CartRemoteDataSourceImpl implements CartRemoteDataSource{
  ApiManager apiManager ;
  CartRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures, GetCartResponseEntity>> getCart()async {
    var either = await apiManager.getCart();
    return either.fold((l) {
      return Left(Failures(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response);
    });
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> deleteItemInCart(String productId) async{
    var either = await apiManager.deleteItemInCart(productId);
    return either.fold((l) {
      return Left(Failures(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response);
    });
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> updateCountInCart
      (String productId,int count)async {
    var either = await apiManager.updateCountInCart(productId,count);
    return either.fold((l) {
      return Left(Failures(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response);
    });
  }

}