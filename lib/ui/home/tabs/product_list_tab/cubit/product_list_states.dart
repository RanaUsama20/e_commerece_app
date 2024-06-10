import 'package:flutter_app_e_commerece_online/domain/entities/AddToCartResponseEntity.dart';
import 'package:flutter_app_e_commerece_online/domain/entities/ProductResponseEntity.dart';
import 'package:flutter_app_e_commerece_online/domain/entities/failures.dart';

abstract class ProductListTabStates{}

class ProductListTabInitialStates extends ProductListTabStates{}
class ProductListTabLoadingStates extends ProductListTabStates{
  String? loadingMessage  ;
  ProductListTabLoadingStates({required this.loadingMessage});
}
class ProductListTabErrorStates extends ProductListTabStates{
  Failures errors ;
  ProductListTabErrorStates({required this.errors});
}

class ProductListTabSuccessStates extends ProductListTabStates {
  ProductResponseEntity productResponseEntity ;
  ProductListTabSuccessStates({required this.productResponseEntity});
}

class AddToCartLoadingStates extends ProductListTabStates {
  String? loadingMessage;

  AddToCartLoadingStates({required this.loadingMessage});
}

class AddToCartTabErrorStates extends ProductListTabStates {
  Failures errors;

  AddToCartTabErrorStates({required this.errors});
}

class AddToCartSuccessStates extends ProductListTabStates {
  AddToCartResponseEntity addToCartResponseEntity;

  AddToCartSuccessStates({required this.addToCartResponseEntity});
}