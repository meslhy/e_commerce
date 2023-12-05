import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/failures.dart';
import 'package:e_commerce/data/model/responses/CartResponse.dart';
import 'package:e_commerce/data/model/responses/category_dm.dart';
import 'package:e_commerce/data/model/responses/product_dm.dart';

abstract class HomeOnlineDS{

  Future<Either<Failuer,List<CategoryDM>>> getCategories();

  Future<Either<Failuer,List<ProductDM>>> getProduct();

  Future<Either<Failuer,CartDM>> getLoggedUserCart();


  Future<Either<Failuer,CartDM>> addProductToCart(String productID);


  Future<Either<Failuer,CartDM>> removeProductFromCart(String productID);
}