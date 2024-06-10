import 'package:flutter_app_e_commerece_online/data/model/response/CategoryOrBrandResponseDto.dart';
import 'package:flutter_app_e_commerece_online/data/model/response/ProductResponseDto.dart';
import 'package:flutter_app_e_commerece_online/domain/entities/GetCartResponseEntity.dart';

class GetCartResponseDto extends GetCartResponseEntity {
  GetCartResponseDto({
    super.status,
    super.numOfCartItems,
    super.data,
  this.message
  });
  String? message ;

  GetCartResponseDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    data = json['data'] != null ? GetDataCartDto.fromJson(json['data']) : null;
  }
}

class GetDataCartDto extends GetDataCartEntity {
  GetDataCartDto({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  GetDataCartDto.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(GetProductCartDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

class GetProductCartDto extends GetProductCartEntity {
  GetProductCartDto({
    super.count,
    super.id,
    super.product,
    super.price,
  });

  GetProductCartDto.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'] != null
        ? GetProductDto.fromJson(json['product'])
        : null;
    price = json['price'];
  }
}

class GetProductDto extends GetProductEntity {
  GetProductDto({
    super.subcategory,
    super.id,
    super.title,
    super.quantity,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
  });

  GetProductDto.fromJson(dynamic json) {
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(SubcategoryDto.fromJson(v));
      });
    }
    id = json['_id'];
    title = json['title'];
    quantity = json['quantity'];
    imageCover = json['imageCover'];
    category = json['category'] != null
        ? CategoryOrBrandDto.fromJson(json['category'])
        : null;
    brand = json['brand'] != null
        ? CategoryOrBrandDto.fromJson(json['brand'])
        : null;
    ratingsAverage = json['ratingsAverage'];
    id = json['id'];
  }
}
