import 'package:bloc_cubit/login/viewmodel/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            LoginCubit(_formKey, _emailController, _passwordController),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return buildScaffold(context, state);
          },
        ));
  }

  Scaffold buildScaffold(BuildContext context, LoginState state) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cubit"),
      ),
      body: Form(
        autovalidateMode: autoValidate(state),
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildTextFormFieldEmail(),
            buildTextFormFieldPassword(),
            ElevatedButton(
                onPressed: () {
                  context.read<LoginCubit>().postUserModel();
                },
                child: Text("Save")),
          ],
        ),
      ),
    );
  }

  AutovalidateMode autoValidate(LoginState state) {
    return state is LoginValidateState
        ? (state.isValidate
            ? AutovalidateMode.always
            : AutovalidateMode.disabled)
        : AutovalidateMode.disabled;
  }

  TextFormField buildTextFormFieldEmail() {
    return TextFormField(
      controller: _emailController,
      validator: (value) => value!.length > 5 ? null : "Eksik bilgi",
      decoration:
          InputDecoration(border: OutlineInputBorder(), hintText: "email"),
    );
  }

  TextFormField buildTextFormFieldPassword() {
    return TextFormField(
      controller: _passwordController,
      validator: (value) => value!.length > 6 ? null : "Eksik bilgi",
      decoration:
          InputDecoration(border: OutlineInputBorder(), hintText: "şifre"),
    );
  }
}
