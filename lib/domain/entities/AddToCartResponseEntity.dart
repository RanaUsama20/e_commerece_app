class AddToCartResponseEntity {
  AddToCartResponseEntity({
    this.status,
    this.message,
    this.numOfCartItems,
    this.data,
  });

  String? status;
  String? message;
  int? numOfCartItems;
  AddDataCartEntity? data;
}

class AddDataCartEntity {
  AddDataCartEntity({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });

  String? id;
  String? cartOwner;
  List<AddProductCartEntity>? products;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? totalCartPrice;
}

class AddProductCartEntity {
  AddProductCartEntity({
    this.count,
    this.id,
    this.product,
    this.price,
  });

  int? count;
  String? id;
  String? product;
  int? price;
}
