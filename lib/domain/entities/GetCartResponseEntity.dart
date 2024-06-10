import 'package:flutter_app_e_commerece_online/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:flutter_app_e_commerece_online/domain/entities/ProductResponseEntity.dart';
class GetCartResponseEntity {
  GetCartResponseEntity({
      this.status, 
      this.numOfCartItems, 
      this.data,});

  String? status;
  int? numOfCartItems;
  GetDataCartEntity? data;

}

class GetDataCartEntity {
  GetDataCartEntity({
      this.id, 
      this.cartOwner, 
      this.products, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.totalCartPrice,});

  String? id;
  String? cartOwner;
  List<GetProductCartEntity>? products;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? totalCartPrice;


}

class GetProductCartEntity {
  GetProductCartEntity({
      this.count, 
      this.id, 
      this.product, 
      this.price,});

  int? count;
  String? id;
  GetProductEntity? product;
  int? price;

}

class GetProductEntity {
  GetProductEntity({
      this.subcategory, 
      this.id, 
      this.title, 
      this.quantity, 
      this.imageCover, 
      this.category, 
      this.brand, 
      this.ratingsAverage, 
      });

  List<SubcategoryEntity>? subcategory;
  String? id;
  String? title;
  int? quantity;
  String? imageCover;
  CategoryOrBrandEntity? category;
  CategoryOrBrandEntity? brand;
  num? ratingsAverage;

}
