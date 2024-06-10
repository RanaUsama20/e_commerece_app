import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerece_online/domain/use_cases/login_use_case.dart';
import 'package:flutter_app_e_commerece_online/domain/use_cases/register_use_case.dart';
import 'package:flutter_app_e_commerece_online/ui/auth/login/cubit/login_states.dart';
import 'package:flutter_app_e_commerece_online/ui/auth/register/cubit/register_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreenViewModel extends Cubit<LoginStates>{
  LoginScreenViewModel({required this.loginUseCase}):super(LoginInitialState());
  var formKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  bool isObscure = true;
 LoginUseCase loginUseCase ;
  // todo: hold data - handle logic

  void login()async{
    if (formKey.currentState?.validate() == true) {
      // register
        emit(LoginLoadingState(loadingMessage: 'Loading...'));
        var either = await loginUseCase.invoke(emailController.text,
            passwordController.text);
        either.fold((l) {
          emit(LoginErrorState(errorMessage: l.errorMessage));
        },
                (response) {
          emit(LoginSuccessState(response: response));
                }
        );

    }

  }
}