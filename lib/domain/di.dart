import 'package:flutter_app_e_commerece_online/data/repository/data_source/cart_remote_data_source_impl.dart';
import 'package:flutter_app_e_commerece_online/data/repository/repository/auth_repository_impl.dart';
import 'package:flutter_app_e_commerece_online/data/repository/repository/cart_repository_impl.dart';
import 'package:flutter_app_e_commerece_online/data/repository/repository/home_repository_impl.dart';
import 'package:flutter_app_e_commerece_online/domain/repository/data_source/auth_remote_data_source.dart';
import 'package:flutter_app_e_commerece_online/domain/repository/data_source/cart_remote_data_source.dart';
import 'package:flutter_app_e_commerece_online/domain/repository/data_source/home_remote_data_source.dart';
import 'package:flutter_app_e_commerece_online/domain/repository/repository/auth_repository_contract.dart';
import 'package:flutter_app_e_commerece_online/domain/repository/repository/cart_repository_contract.dart';
import 'package:flutter_app_e_commerece_online/domain/repository/repository/home_repository_contract.dart';
import 'package:flutter_app_e_commerece_online/domain/use_cases/add_to_cart_use_case.dart';
import 'package:flutter_app_e_commerece_online/domain/use_cases/delete_item_in_cart_use_case.dart';
import 'package:flutter_app_e_commerece_online/domain/use_cases/get_all_brands_use_case.dart';
import 'package:flutter_app_e_commerece_online/domain/use_cases/get_all_categories_use_case.dart';
import 'package:flutter_app_e_commerece_online/domain/use_cases/get_all_products_use_case.dart';
import 'package:flutter_app_e_commerece_online/domain/use_cases/get_cart_use_case.dart';
import 'package:flutter_app_e_commerece_online/domain/use_cases/login_use_case.dart';
import 'package:flutter_app_e_commerece_online/domain/use_cases/register_use_case.dart';
import 'package:flutter_app_e_commerece_online/domain/use_cases/update_count_in_cart_use_case.dart';

import '../data/api/api_manager.dart';
import '../data/repository/data_source/auth_remote_data_source_impl.dart';
import '../data/repository/data_source/home_remote_data_source_impl.dart';

AuthRepositoryContract injectAuthRepositoryContract() {
  return AuthRepositoryImpl(remoteDataSource: injectAuthRemoteDataSource());
}

AuthRemoteDataSource injectAuthRemoteDataSource() {
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}

RegisterUseCase injectRegisterUseCase() {
  return RegisterUseCase(repositoryContract: injectAuthRepositoryContract());
}

LoginUseCase injectLoginUseCase() {
  return LoginUseCase(repositoryContract: injectAuthRepositoryContract());
}

GetAllCategoriesUseCase injectGetAllCategoriesUseCase() {
  return GetAllCategoriesUseCase(
      repositoryContract: injectHomeRepositoryContract());
}

GetAllBrandsUseCase injectGetAllBrandsUseCase() {
  return GetAllBrandsUseCase(
      repositoryContract: injectHomeRepositoryContract());
}

GetAllProductsUseCase injectGetAllProductsUseCase() {
  return GetAllProductsUseCase(
      repositoryContract: injectHomeRepositoryContract());
}

AddToCartUseCase injectAddToCartUseCase() {
  return AddToCartUseCase(repositoryContract: injectHomeRepositoryContract());
}

HomeRepositoryContract injectHomeRepositoryContract() {
  return HomeRepositoryImpl(remoteDataSource: injectHomeRemoteDataSource());
}

HomeRemoteDataSource injectHomeRemoteDataSource() {
  return HomeRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}

GetCartUseCase injectGetCartUseCase() {
  return GetCartUseCase(repositoryContract: injectCartRepository());
}
DeleteItemInCartUseCase injectDeleteItemInCartUseCase() {
  return DeleteItemInCartUseCase(repositoryContract: injectCartRepository());
}
UpdateCountInCartUseCase injectUpdateCountInCartUseCase() {
  return UpdateCountInCartUseCase(repositoryContract: injectCartRepository());
}

CartRepositoryContract injectCartRepository() {
  return CartRepositoryImpl(cartRemoteDataSource: injectCartRemoteDataSource());
}
CartRemoteDataSource injectCartRemoteDataSource(){
  return CartRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}