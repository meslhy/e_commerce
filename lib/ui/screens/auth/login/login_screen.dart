import 'package:e_commerce/data/repos/auth_repo/auth_repo_impl.dart';
import 'package:e_commerce/domain/use_cases/login_use_case.dart';
import 'package:e_commerce/ui/screens/auth/login/login_view_model.dart';
import 'package:e_commerce/ui/screens/auth/register/register_screen.dart';
import 'package:e_commerce/ui/utils/app_assets.dart';
import 'package:e_commerce/ui/utils/base_request_states.dart';
import 'package:e_commerce/ui/utils/dialog_utils.dart';
import 'package:e_commerce/ui/widgets/custom_button.dart';
import 'package:e_commerce/ui/widgets/custom_text_form_field.dart';
import 'package:e_commerce/ui/widgets/form_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget{
  static const String routeName = "login";
  LoginViewModel viewModel = LoginViewModel(LoginUseCase(AuthRepoImpl()));


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: BlocListener(
        bloc:viewModel ,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: viewModel.loginKey,
              child:Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Image.asset(AppAssets.routeLogo),
                    const SizedBox(
                      height: 86,
                    ),
                    Text(
                      'Welcome Back To Route',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Please sign in with your mail',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    FormLabelWidget(
                      label: 'Email Address',
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomTextFormField(
                        controller: viewModel.emailController,
                        hintText: 'enter your email address',
                        // controller: viewModel.emailController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please enter email';
                          }
                          var emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(text);

                          if (!emailValid) {
                            return 'Email format is not valid';
                          }

                          return null;
                        },
                        type: TextInputType.emailAddress),
                    const SizedBox(
                      height: 32,
                    ),
                    FormLabelWidget(
                      label: 'Password',
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomTextFormField(
                      hintText: 'enter your password',
                      controller: viewModel.passController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please enter password ';
                        }
                        if (text.length < 6) {
                          return 'Password should be at least 6 chars.';
                        }
                        return null;
                      },
                      type: TextInputType.visiblePassword,
                      isPassword: true,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomButtonWidget(
                        title: 'Login',
                        onPressed: () {
                          viewModel.login();
                        }),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FormLabelWidget(label: "Don't have an account ? "),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, RegisterScreen.routeName);
                          },
                          child: FormLabelWidget(label: 'Create Account'),
                        ),

                      ],
                    ),
                  ]
              ),
            ),
          ),
        ),
        listener: (context, state){
          print("state is : $state");
          if(state is BaseRequestLoadingState)
            {
              showLoading(context);
            }else if (state is BaseRequestSuccessState){
            Navigator.pop(context);
          }else if (state is BaseRequestErrorState){
            Navigator.pop(context);
            showErrorDialog(context, state.message);
          }
        },
      )
    );
  }


}
