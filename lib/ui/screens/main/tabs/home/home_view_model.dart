import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/failures.dart';
import 'package:e_commerce/data/model/responses/category_dm.dart';
import 'package:e_commerce/data/model/responses/product_dm.dart';
import 'package:e_commerce/domain/use_cases/get_all_categories_use_case.dart';
import 'package:e_commerce/domain/use_cases/get_all_products_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends Cubit<HomeInitialState>{

  GetAllCategoriesUseCase categoriesUseCase;
  GetAllProductsUseCase productUseCase;

  HomeViewModel(
      this.categoriesUseCase,
      this.productUseCase
      ):super(HomeInitialState());

  getAllCategories(){
    categoriesUseCase.execute();
  }

  getAllProducts(){
    productUseCase.execute();
  }


}


class HomeInitialState{}
class HomeSuccessState<type> extends HomeInitialState{
  type? data;
  HomeSuccessState(this.data);
}
class HomeErrorState extends HomeInitialState {
  String error;
  HomeErrorState(this.error);
}