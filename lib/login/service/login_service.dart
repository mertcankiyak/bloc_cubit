import 'dart:io';

import 'package:bloc_cubit/login/model/login_response.dart';
import 'package:bloc_cubit/login/model/login_request_model.dart';
import 'package:bloc_cubit/login/service/ILogin_service.dart';
import 'package:dio/src/dio.dart';

class LoginService extends ILoginService {
  LoginService(Dio dio) : super(dio);

  @override
  Future<LoginResponeModel?> postUserLogin(LoginRequestModel model) async {
    final response = await dio.post(loginPath, data: model);
    if (response.statusCode == HttpStatus.ok) {
      return LoginResponeModel.fromJson(response.data);
    } else {
      return null;
    }
  }
}
