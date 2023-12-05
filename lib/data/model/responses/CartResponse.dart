import 'package:e_commerce/data/model/responses/base_response.dart';
import 'package:e_commerce/data/model/responses/product_dm.dart';

/// status : "success"
/// numOfCartItems : 1
/// data : {"_id":"6551216bbbbe637de5ca924d","cartOwner":"653ec11297b8479748c1f931","products":[{"count":5,"_id":"65578d996f7d6fb5a5e3ae35","product":{"subcategory":[{"_id":"6407f243b575d3b90bf957ac","name":"Men's Clothing","slug":"men's-clothing","category":"6439d5b90049ad0b52b90048"}],"_id":"6428def9dc1175abc65ca061","title":"Orca Leather Boots Anthracite","quantity":273,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680400120400-cover.jpeg","category":{"_id":"6439d5b90049ad0b52b90048","name":"Men's Fashion","slug":"men's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511865180.jpeg"},"brand":null,"ratingsAverage":4.9,"id":"6428def9dc1175abc65ca061"},"price":4829}],"createdAt":"2023-11-12T19:03:07.237Z","updatedAt":"2023-11-17T17:06:13.369Z","__v":17,"totalCartPrice":24145}

class CartResponse extends BaseResponse {
  CartResponse({
      this.status, 
      this.numOfCartItems, 
      this.data,});

  CartResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    data = json['data'] != null ? CartDM.fromJson(json['data']) : null;
  }
  String? status;
  int? numOfCartItems;
  CartDM? data;



}

/// _id : "6551216bbbbe637de5ca924d"
/// cartOwner : "653ec11297b8479748c1f931"
/// products : [{"count":5,"_id":"65578d996f7d6fb5a5e3ae35","product":{"subcategory":[{"_id":"6407f243b575d3b90bf957ac","name":"Men's Clothing","slug":"men's-clothing","category":"6439d5b90049ad0b52b90048"}],"_id":"6428def9dc1175abc65ca061","title":"Orca Leather Boots Anthracite","quantity":273,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680400120400-cover.jpeg","category":{"_id":"6439d5b90049ad0b52b90048","name":"Men's Fashion","slug":"men's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511865180.jpeg"},"brand":null,"ratingsAverage":4.9,"id":"6428def9dc1175abc65ca061"},"price":4829}]
/// createdAt : "2023-11-12T19:03:07.237Z"
/// updatedAt : "2023-11-17T17:06:13.369Z"
/// __v : 17
/// totalCartPrice : 24145

class CartDM {
  CartDM({
      this.id, 
      this.cartOwner, 
      this.products, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.totalCartPrice,});

  CartDM.fromJson(dynamic json) {
    id = json['_id'];

    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(CartProduct.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
  String? id;
  String? cartOwner;
  List<CartProduct>? products;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? totalCartPrice;



}

/// count : 5
/// _id : "65578d996f7d6fb5a5e3ae35"
/// product : {"subcategory":[{"_id":"6407f243b575d3b90bf957ac","name":"Men's Clothing","slug":"men's-clothing","category":"6439d5b90049ad0b52b90048"}],"_id":"6428def9dc1175abc65ca061","title":"Orca Leather Boots Anthracite","quantity":273,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680400120400-cover.jpeg","category":{"_id":"6439d5b90049ad0b52b90048","name":"Men's Fashion","slug":"men's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511865180.jpeg"},"brand":null,"ratingsAverage":4.9,"id":"6428def9dc1175abc65ca061"}
/// price : 4829

class CartProduct {
  CartProduct({
      this.count,
      this.id,
      this.product,
      this.price,});

  CartProduct.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'] != null ? ProductDM.fromJson(json['product']) : null;
    price = json['price'];
  }
  int? count;
  String? id;
  ProductDM? product;
  int? price;


}

