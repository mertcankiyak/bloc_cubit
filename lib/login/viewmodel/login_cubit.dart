import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class LoginCubit extends Cubit<LoginState> {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  bool isLoginFail = false;

  void postUserModel() {
    if (formKey.currentState?.validate() ?? false) {
      // TODO service code
    } else {
      isLoginFail = true;
      emit(LoginValidateState(isLoginFail));
    }
  }

  LoginCubit(this.formKey, this.emailController, this.passwordController)
      : super(LoginInitial());
}

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginValidateState extends LoginState {
  final bool isValidate;

  LoginValidateState(this.isValidate);
}
