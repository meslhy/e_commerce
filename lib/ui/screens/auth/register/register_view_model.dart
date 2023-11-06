import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/failures.dart';
import 'package:e_commerce/data/model/request/RegisterRequestBody.dart';
import 'package:e_commerce/domain/use_cases/register_use_case.dart';
import 'package:e_commerce/ui/utils/base_request_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterViewModel extends Cubit{
  GlobalKey<FormState> registerKey = GlobalKey();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController rePassController = TextEditingController();
  RegisterUseCase useCase;
  RegisterViewModel(this.useCase):super(BaseRequestInitialState);

  void register() async{
    if(!registerKey.currentState!.validate())return;
    emit(BaseRequestLoadingState());
    Either<Failuer ,bool> response = await
    useCase.execute(RegisterRequestBody(
      name: fullNameController.text,
      email: emailController.text,
      password: passController.text,
      rePassword: rePassController.text,
      phone: mobileController.text,
    ));

    response.fold(
            (error){
          emit(BaseRequestErrorState(error.errorMessage));
        } ,
            (success) {
          emit(BaseRequestSuccessState());
        });
  }

}