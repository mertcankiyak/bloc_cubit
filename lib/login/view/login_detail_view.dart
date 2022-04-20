import 'package:bloc_cubit/login/model/login_response.dart';
import 'package:flutter/material.dart';

class LoginDetailView extends StatelessWidget {
  const LoginDetailView({Key? key, required this.model}) : super(key: key);

  final LoginResponeModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(model.token ?? ''),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login successful",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
