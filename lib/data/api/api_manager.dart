import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_app_e_commerece_online/data/api/api_constants.dart';
import 'package:flutter_app_e_commerece_online/data/model/request/LoginRequest.dart';
import 'package:flutter_app_e_commerece_online/data/model/request/RegisterRequest.dart';
import 'package:flutter_app_e_commerece_online/data/model/response/AddToCartResponseDto.dart';
import 'package:flutter_app_e_commerece_online/data/model/response/CategoryOrBrandResponseDto.dart';
import 'package:flutter_app_e_commerece_online/data/model/response/GetCartResponseDto.dart';
import 'package:flutter_app_e_commerece_online/data/model/response/LoginResponseDto.dart';
import 'package:flutter_app_e_commerece_online/data/model/response/ProductResponseDto.dart';
import 'package:flutter_app_e_commerece_online/data/model/response/RegisterResponseDto.dart';
import 'package:flutter_app_e_commerece_online/domain/entities/failures.dart';
import 'package:flutter_app_e_commerece_online/ui/utils/shared_preference_utils.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  ApiManager._();

  static ApiManager? _instance;

  static ApiManager getInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }

  Future<Either<Failures, RegisterResponseDto>> register(String name,
      String email, String password, String rePassword, String phone) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network or wifi .
      Uri url = Uri.https(Apiconstants.baseUrl, Apiconstants.registerApi);
      var requestBody = RegisterRequest(
          name: name,
          email: email,
          rePassword: rePassword,
          phone: phone,
          password: password);
      var response = await http.post(url, body: requestBody.toJson());
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      var registerResponse = RegisterResponseDto.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(registerResponse);
      } else {
        return Left(Failures(
            errorMessage: registerResponse.error != null
                ? registerResponse.error!.msg
                : registerResponse.message));
      }
    } else {
      /// no internet connection
      return Left(Failures(errorMessage: 'Check Internet connection'));
    }
  }

  Future<Either<Failures, LoginResponseDto>> login(
    String email,
    String password,
  ) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network or wifi .
      Uri url = Uri.https(Apiconstants.baseUrl, Apiconstants.loginApi);
      var requestBody = LoginRequest(email: email, password: password);
      var response = await http.post(url, body: requestBody.toJson());
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      var loginResponse = LoginResponseDto.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        // SharedPreferenceUtils.saveData(key: 'token',
        //     value: loginResponse.token);
        return Right(loginResponse);
      } else {
        return Left(Failures(errorMessage: loginResponse.message));
      }
    } else {
      /// no internet connection
      return Left(Failures(errorMessage: 'Check Internet connection'));
    }
  }

  Future<Either<Failures, CategoryOrBrandResponseDto>>
      getAllCategories() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network or wifi .
      Uri url =
          Uri.https(Apiconstants.baseUrl, Apiconstants.getAllCategoriesApi);
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      var categoryResponse = CategoryOrBrandResponseDto.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(categoryResponse);
      } else {
        return Left(Failures(errorMessage: categoryResponse.message));
      }
    } else {
      /// no internet connection
      return Left(Failures(errorMessage: 'Check Internet connection'));
    }
  }

  Future<Either<Failures, CategoryOrBrandResponseDto>> getAllBrands() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network or wifi .
      Uri url = Uri.https(Apiconstants.baseUrl, Apiconstants.getAllBrandsApi);
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      var categoryOrBrandResponse = CategoryOrBrandResponseDto.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(categoryOrBrandResponse);
      } else {
        return Left(ServerError(errorMessage: categoryOrBrandResponse.message));
      }
    } else {
      /// no internet connection
      return Left(NetworkError(errorMessage: 'Check Internet connection'));
    }
  }

  Future<Either<Failures, ProductResponseDto>> getAllProducts() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network or wifi .
      Uri url = Uri.https(Apiconstants.baseUrl, Apiconstants.getAllProductsApi);
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      var productResponse = ProductResponseDto.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(productResponse);
      } else {
        return Left(ServerError(errorMessage: productResponse.message));
      }
    } else {
      /// no internet connection
      return Left(NetworkError(errorMessage: 'Check Internet connection'));
    }
  }

  Future<Either<Failures, AddToCartResponseDto>> addToCart(
      String productId) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network or wifi .
      var token = SharedPreferenceUtils.getData(key: 'Token');
      Uri url = Uri.https(Apiconstants.baseUrl, Apiconstants.addToCartApi);
      var response = await http.post(url,
          body: {'productId': productId}, headers: {'token': token.toString()});
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      var addToCartResponse = AddToCartResponseDto.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(addToCartResponse);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: addToCartResponse.message));
      } else {
        return Left(ServerError(errorMessage: addToCartResponse.message));
      }
    } else {
      /// no internet connection
      return Left(NetworkError(errorMessage: 'Check Internet connection'));
    }
  }

  Future<Either<Failures, GetCartResponseDto>> getCart() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network or wifi .
      var token = SharedPreferenceUtils.getData(key: 'Token');
      Uri url = Uri.https(Apiconstants.baseUrl, Apiconstants.addToCartApi);
      var response = await http.get(url, headers: {'token': token.toString()});
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      var getCartResponse = GetCartResponseDto.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(getCartResponse);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: getCartResponse.message));
      } else {
        return Left(ServerError(errorMessage: getCartResponse.message));
      }
    } else {
      /// no internet connection
      return Left(NetworkError(errorMessage: 'Check Internet connection'));
    }
  }

  Future<Either<Failures, GetCartResponseDto>> deleteItemInCart(
      String productId) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network or wifi .
      var token = SharedPreferenceUtils.getData(key: 'Token');
      Uri url = Uri.https(
          Apiconstants.baseUrl, '${Apiconstants.addToCartApi}/$productId');
      var response =
          await http.delete(url, headers: {'token': token.toString()});
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      var deleteCartResponse = GetCartResponseDto.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(deleteCartResponse);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: deleteCartResponse.message));
      } else {
        return Left(ServerError(errorMessage: deleteCartResponse.message));
      }
    } else {
      /// no internet connection
      return Left(NetworkError(errorMessage: 'Check Internet connection'));
    }
  }

  Future<Either<Failures, GetCartResponseDto>> updateCountInCart(
      String productId,int count) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network or wifi .
      var token = SharedPreferenceUtils.getData(key: 'Token');
      Uri url = Uri.https(
          Apiconstants.baseUrl, '${Apiconstants.addToCartApi}/$productId');
      var response =
          await http.put(url, headers: {'token': token.toString()},
          body: {
            'count':'$count'
          });
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      var updateCartResponse = GetCartResponseDto.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(updateCartResponse);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: updateCartResponse.message));
      } else {
        return Left(ServerError(errorMessage: updateCartResponse.message));
      }
    } else {
      /// no internet connection
      return Left(NetworkError(errorMessage: 'Check Internet connection'));
    }
  }
}
