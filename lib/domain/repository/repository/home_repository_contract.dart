import 'package:dartz/dartz.dart';
import 'package:flutter_app_e_commerece_online/domain/entities/AddToCartResponseEntity.dart';
import 'package:flutter_app_e_commerece_online/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:flutter_app_e_commerece_online/domain/entities/ProductResponseEntity.dart';
import 'package:flutter_app_e_commerece_online/domain/entities/failures.dart';

abstract class HomeRepositoryContract {
  Future<Either<Failures,CategoryOrBrandResponseEntity>> getAllCategories();
  Future<Either<Failures,CategoryOrBrandResponseEntity>> getAllBrands();
  Future<Either<Failures,ProductResponseEntity>> getAllProducts();
  Future<Either<Failures,AddToCartResponseEntity>> addToCart(String productId);
}