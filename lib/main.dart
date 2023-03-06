import 'package:bloc_cubit/login/view/login_view.dart';
import 'package:bloc_cubit/post/view/post_view.dart';
import 'package:bloc_cubit/profile/view/profile_view.dart';

import 'package:flutter/material.dart';

import 'home/view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cubit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DemoPage(),
    );
  }
}

class DemoPage extends StatelessWidget {
  DemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo View"),
      ),
      body: Column(
        children: [
          Image.asset("assets/images/edit_ic.png"),
        ],
      ),
    );
  }
}
