import 'package:flutter_app_e_commerece_online/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:flutter_app_e_commerece_online/domain/entities/failures.dart';

abstract class HomeTabStates {}

class HomeTabInitialStates extends HomeTabStates {}

class HomeTabCategoryLoadingStates extends HomeTabStates {
  String? loadingMessage;

  HomeTabCategoryLoadingStates({this.loadingMessage});
}

class HomeTabCategoryErrorStates extends HomeTabStates {
  String? errorMessage;

  HomeTabCategoryErrorStates({this.errorMessage});
}

class HomeTabCategorySuccessStates extends HomeTabStates {
  CategoryOrBrandResponseEntity categoryEntity;

  HomeTabCategorySuccessStates({required this.categoryEntity});
}

class HomeTabBrandLoadingStates extends HomeTabStates {
  String? loadingMessage;

  HomeTabBrandLoadingStates({this.loadingMessage});
}

class HomeTabBrandErrorStates extends HomeTabStates {
  Failures errors ;
  HomeTabBrandErrorStates({required this.errors});
}

class HomeTabBrandSuccessStates extends HomeTabStates {
  CategoryOrBrandResponseEntity categoryOrBrandEntity;

  HomeTabBrandSuccessStates({required this.categoryOrBrandEntity});
}
