import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/failures.dart';
import 'package:e_commerce/data/model/responses/CartResponse.dart';
import 'package:e_commerce/data/model/responses/Categories_response.dart';
import 'package:e_commerce/data/model/responses/ProductsResponse.dart';
import 'package:e_commerce/data/model/responses/category_dm.dart';
import 'package:e_commerce/data/model/responses/product_dm.dart';
import 'package:e_commerce/data/utils/shared_utils.dart';
import 'package:e_commerce/domain/repos/home_repo/ds/home_online_ds.dart';
import 'package:e_commerce/ui/utils/constants.dart';
import 'package:e_commerce/ui/utils/end_points.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: HomeOnlineDS)
class HomeOnlineDSImpl extends HomeOnlineDS {


  SharedPrefsUtils sharedPrefsUtils;

  HomeOnlineDSImpl(this.sharedPrefsUtils);


  @override
  Future<Either<Failuer, List<CategoryDM>>> getCategories() async{
   try{
     Uri url = Uri.https(EndPoints.baseUrl , EndPoints.categories);
     Response serverResponse = await get(url);
     CategoriesResponse response =CategoriesResponse.fromJson(jsonDecode(serverResponse.body));
     if(serverResponse.statusCode >= 200 && serverResponse.statusCode < 300 && response.data?.isNotEmpty == true ){
       return right(response.data!);
     }else{
       return left(Failuer(response.message!));
     }
   }catch(e){
     return left(Failuer(e.toString()));
   }

  }

  @override
  Future<Either<Failuer, List<ProductDM>>> getProduct() async{
    try{
      Uri url = Uri.https(EndPoints.baseUrl , EndPoints.products);
      Response serverResponse = await get(url);
      ProductsResponse response =ProductsResponse.fromJson(jsonDecode(serverResponse.body));
      if(serverResponse.statusCode >= 200 && serverResponse.statusCode < 300 && response.data?.isNotEmpty == true ){
        return right(response.data!);
      }else{
        return left(Failuer(response.message!));
      }
    }catch(e){
      return left(Failuer(e.toString()));
    }
  }

  @override
  Future<Either<Failuer, CartDM>> getLoggedUserCart() async{
    String token = (await sharedPrefsUtils.getToken())!;
    try{
      Uri url = Uri.https(EndPoints.baseUrl , EndPoints.cart);
      Response serverResponse = await get(url,headers: {
        "token":token
      });
      CartResponse response =CartResponse.fromJson(jsonDecode(serverResponse.body));
      if(serverResponse.statusCode >= 200 && serverResponse.statusCode < 300 && response.data != null){
        return right(response.data!);
      }else{
        return left(Failuer(response.message??Constants.defaultErrorMessage));
      }
      
    }catch(e,ee){
      print("Exception while calling:getLoggedUserCart:$e in:$ee");
      return left(Failuer(Constants.defaultErrorMessage));
    }
  }

  @override
  Future<Either<Failuer, CartDM>> addProductToCart(String productID) async{
    String token = (await sharedPrefsUtils.getToken())!;
    try{
      Uri url = Uri.https(EndPoints.baseUrl , EndPoints.cart);
      Response serverResponse = await post( url, body: {
        "productId":productID
      }, headers: {
        "token":token
      });

      Map json = jsonDecode(serverResponse.body);
      if(serverResponse.statusCode >= 200 && serverResponse.statusCode < 300 ){
        return getLoggedUserCart();
      }else{
        return left(Failuer(json["message"]??Constants.defaultErrorMessage));
      }

    }catch(e,ee){
      print("Exception while calling:addCart:$e in:$ee");
      return left(Failuer(Constants.defaultErrorMessage));
    }
  }

  @override
  Future<Either<Failuer, CartDM>> removeProductFromCart(String productID) async{
    String token = (await sharedPrefsUtils.getToken())!;
    try{
      Uri url =   Uri.parse("https://${EndPoints.baseUrl}${EndPoints.cart}/$productID");
      Response serverResponse = await delete(url,headers: {
        "token":token
      });
      Map json = jsonDecode(serverResponse.body);
      if(serverResponse.statusCode >= 200 && serverResponse.statusCode < 300){
        return getLoggedUserCart();
      }else{
        return left(Failuer(json["message"]??Constants.defaultErrorMessage));
      }

    }catch(e,ee){
      print("Exception while calling:deleteCart:$e in:$ee");
      return left(Failuer(Constants.defaultErrorMessage));
    }
  }


}