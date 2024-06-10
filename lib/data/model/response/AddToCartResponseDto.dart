import 'package:flutter_app_e_commerece_online/domain/entities/AddToCartResponseEntity.dart';

class AddToCartResponseDto extends AddToCartResponseEntity {
  AddToCartResponseDto({
    super.status,
    super.message,
    super.numOfCartItems,
    super.data,
  });

  AddToCartResponseDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    data = json['data'] != null ? AddDataCartDto.fromJson(json['data']) : null;
  }
}

class AddDataCartDto extends AddDataCartEntity {
  AddDataCartDto({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  AddDataCartDto.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(AddProductCartDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

class AddProductCartDto extends AddProductCartEntity {
  AddProductCartDto({
    super.count,
    super.id,
    super.product,
    super.price,
  });

  AddProductCartDto.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }
}
