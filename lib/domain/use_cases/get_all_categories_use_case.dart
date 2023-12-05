import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/failures.dart';
import 'package:e_commerce/data/model/responses/category_dm.dart';
import 'package:e_commerce/domain/repos/home_repo/home_repo.dart';
import 'package:e_commerce/ui/utils/base_request_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllCategoriesUseCase extends Cubit{
  HomeRepo repo;
  GetAllCategoriesUseCase(this.repo) : super(BaseRequestInitialState());
  void execute() async{
    Either<Failuer,List<CategoryDM>> either = await repo.getCategories();

    return either.fold(
            (failure) => emit(BaseRequestErrorState(failure.errorMessage)),
            (categories) => emit(BaseRequestSuccessState<List<CategoryDM>>(data: categories))
    );
  }
}