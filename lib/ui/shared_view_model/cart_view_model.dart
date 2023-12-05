import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/failures.dart';
import 'package:e_commerce/data/model/responses/CartResponse.dart';
import 'package:e_commerce/domain/use_cases/add_to_cart_user_case.dart';
import 'package:e_commerce/domain/use_cases/get_logged_user_cart_use_case.dart';
import 'package:e_commerce/domain/use_cases/remove_frome_cart_user_case.dart';
import 'package:e_commerce/ui/utils/base_request_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartViewModel extends Cubit{
  GetLoggedUserCartUseCase getLoggedUserCartUseCase;
  AddToCartUseCase addToCartUseCase;
  RemoveFromCartUseCase removeFromCartUseCase;
  CartDM? cartDM;

  CartViewModel(
      this.getLoggedUserCartUseCase,
      this.addToCartUseCase,
      this.removeFromCartUseCase
      ):super(BaseRequestInitialState());

  getLoggedUserCart()async{
    emit(BaseRequestLoadingState());
    Either<Failuer, CartDM> either = await getLoggedUserCartUseCase.execute();
    either.fold((error) => emit(BaseRequestErrorState(error.errorMessage)),
            (cart) {
      cartDM = cart;
      emit(BaseRequestSuccessState<CartDM>(data: cart));
    });
  }

  addToCart(String productID)async{
    emit(BaseRequestLoadingState());
    Either<Failuer, CartDM> either = await addToCartUseCase.execute(productID);
    either.fold((error) => emit(BaseRequestErrorState(error.errorMessage)),
            (cart) {
      cartDM = cart;
      emit(BaseRequestSuccessState<CartDM>(data: cart));
    });
  }

  removeFromCart(String productID)async{
    emit(BaseRequestLoadingState());
    Either<Failuer, CartDM> either = await removeFromCartUseCase.execute(productID);
    either.fold((error) => emit(BaseRequestErrorState(error.errorMessage)),
            (cart) {
      cartDM = cart;
      emit(BaseRequestSuccessState<CartDM>(data: cart));
    });
  }

  CartProduct? isProductInCart(String productId){
    if(cartDM != null && cartDM!.products != null) {
      var productsInCart = cartDM!.products!;
      for (int i = 0; i < productsInCart.length;i++) {
        if(productId == productsInCart[i].product?.id){
          return productsInCart[i];
        }
      }
    }
    return null;
  }

}