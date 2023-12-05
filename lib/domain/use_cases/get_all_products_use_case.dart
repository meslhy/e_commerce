import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/failures.dart';
import 'package:e_commerce/data/model/responses/category_dm.dart';
import 'package:e_commerce/data/model/responses/product_dm.dart';
import 'package:e_commerce/domain/repos/home_repo/home_repo.dart';
import 'package:e_commerce/ui/utils/base_request_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllProductsUseCase extends Cubit{
  HomeRepo repo;
  GetAllProductsUseCase(this.repo) : super(BaseRequestInitialState());
  void execute()async{

     Either<Failuer,List<ProductDM>> either = await repo.getProduct();

     return either.fold(
             (failure) => emit(BaseRequestErrorState(failure.errorMessage)),
             (products) => emit(BaseRequestSuccessState<List<ProductDM>>(data: products))
     );
  }
}