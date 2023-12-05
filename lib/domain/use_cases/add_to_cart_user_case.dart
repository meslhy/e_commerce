import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/failures.dart';
import 'package:e_commerce/data/model/responses/CartResponse.dart';
import 'package:e_commerce/domain/repos/home_repo/home_repo.dart';
import 'package:e_commerce/ui/utils/base_request_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';


@injectable
class AddToCartUseCase extends Cubit{

  HomeRepo repo;
  CartDM? cartDM;

  AddToCartUseCase(this.repo):super(BaseRequestInitialState());



  Future<Either<Failuer,CartDM>> execute(String productID)async{
     return repo.addProductToCart(productID);
  }
}