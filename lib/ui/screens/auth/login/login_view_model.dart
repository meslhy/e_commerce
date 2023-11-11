import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/failures.dart';
import 'package:e_commerce/domain/use_cases/login_use_case.dart';
import 'package:e_commerce/ui/utils/base_request_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<BaseRequestStates>{
    GlobalKey<FormState> loginKey = GlobalKey();
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    LoginUseCase loginUseCase ;

  LoginViewModel(this.loginUseCase) : super(BaseRequestInitialState());

    void login() async{

      if( !loginKey.currentState!.validate())return;
      emit(BaseRequestLoadingState());
      Either<Failuer ,bool> response = await
      loginUseCase.execute(emailController.text, passController.text);

      response.fold(
              (error){
                emit(BaseRequestErrorState(error.errorMessage));
              } ,
              (success) {
                emit(BaseRequestSuccessState());
              });
    }

}

