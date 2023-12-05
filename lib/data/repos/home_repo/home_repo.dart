import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/failures.dart';
import 'package:e_commerce/data/model/responses/CartResponse.dart';
import 'package:e_commerce/data/model/responses/category_dm.dart';
import 'package:e_commerce/data/model/responses/product_dm.dart';
import 'package:e_commerce/domain/repos/home_repo/ds/home_online_ds.dart';
import 'package:e_commerce/domain/repos/home_repo/home_repo.dart';
import 'package:e_commerce/ui/utils/constants.dart';
import 'package:e_commerce/ui/utils/extensions.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl extends HomeRepo{
  Connectivity connectivity;
  HomeOnlineDS ds;
  HomeRepoImpl(this.connectivity , this.ds);

  @override
  Future<Either<Failuer, List<CategoryDM>>> getCategories() async{
    if(await connectivity.isInternetConnective){
      return ds.getCategories();
    }else{
      return Left(Failuer(Constants.internetErrorMessage));
    }

  }

  @override
  Future<Either<Failuer, List<ProductDM>>> getProduct() async{
    if(await connectivity.isInternetConnective){
      return ds.getProduct();
    }else{
      return Left(Failuer(Constants.internetErrorMessage));
    }

  }

  @override
  Future<Either<Failuer, CartDM>> addProductToCart(String productID) async{
    if(await connectivity.isInternetConnective){
      return ds.addProductToCart(productID);
    }else{
      return Left(Failuer(Constants.internetErrorMessage));
    }
  }

  @override
  Future<Either<Failuer, CartDM>> getLoggedUserCart() async{
    if(await connectivity.isInternetConnective){
      return ds.getLoggedUserCart();
    }else{
      return Left(Failuer(Constants.internetErrorMessage));
    }
  }

  @override
  Future<Either<Failuer, CartDM>> removeProductFromCart(String productID) async{
    if(await connectivity.isInternetConnective){
      return ds.removeProductFromCart(productID);
    }else{
      return Left(Failuer(Constants.internetErrorMessage));
    }
  }

}