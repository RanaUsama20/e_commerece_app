import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerece_online/domain/use_cases/register_use_case.dart';
import 'package:flutter_app_e_commerece_online/ui/auth/register/cubit/register_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreenViewModel extends Cubit<RegisterStates>{
  RegisterScreenViewModel({required this.registerUseCase}):super(RegisterInitialState());
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmationPasswordController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  bool isObscure = true;
 RegisterUseCase registerUseCase ;
  // todo: hold data - handle logic

  void register()async{
    if (formKey.currentState?.validate() == true) {
      // register
        emit(RegisterLoadingState(loadingMessage: 'Loading...'));
        var either = await registerUseCase.invoke(nameController.text, emailController.text,
            passwordController.text, confirmationPasswordController.text,
            phoneController.text);
        either.fold((l) {
          emit(RegisterErrorState(errorMessage: l.errorMessage));
        },
                (response) {
          emit(RegisterSuccessState(response: response));
                }
        );

    }

  }
}