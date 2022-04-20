import 'package:bloc_cubit/login/service/login_service.dart';
import 'package:bloc_cubit/login/view/login_detail_view.dart';
import 'package:bloc_cubit/login/viewmodel/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

class LoginView extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final String baseUrl = 'https://reqres.in/api';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginCubit(
            _formKey, _emailController, _passwordController,
            service: LoginService(Dio(BaseOptions(baseUrl: baseUrl)))),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginComplete) {
              state.navigate(context);
            }
          },
          builder: (context, state) {
            return buildScaffold(context, state);
          },
        ));
  }

  Scaffold buildScaffold(BuildContext context, LoginState state) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.indigo,
        leading: Visibility(
          visible: context.watch<LoginCubit>().isLoading,
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
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
            buildElevatedButton(context),
          ],
        ),
      ),
    );
  }

  Widget buildElevatedButton(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is LoginComplete) {
          return Card(
            child: Icon(Icons.check),
          );
        }
        return ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green)),
            onPressed: context.watch<LoginCubit>().isLoading
                ? null
                : () {
                    context.read<LoginCubit>().postUserModel();
                  },
            child: Text("Save"));
      },
    );
  }

  AutovalidateMode autoValidate(LoginState state) {
    return state is LoginValidateState
        ? (state.isValidate
            ? AutovalidateMode.always
            : AutovalidateMode.disabled)
        : AutovalidateMode.disabled;
  }

  Padding buildTextFormFieldEmail() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: _emailController,
        validator: (value) => value!.length > 5 ? null : "Eksik bilgi",
        decoration:
            InputDecoration(border: OutlineInputBorder(), hintText: "email"),
      ),
    );
  }

  Padding buildTextFormFieldPassword() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: _passwordController,
        validator: (value) => value!.length > 6 ? null : "Eksik bilgi",
        decoration:
            InputDecoration(border: OutlineInputBorder(), hintText: "password"),
      ),
    );
  }
}

extension LoginCompleteExtensions on LoginComplete {
  void navigate(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => LoginDetailView(model: model)));
  }
}
