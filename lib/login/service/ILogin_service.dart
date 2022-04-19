import 'package:bloc_cubit/login/model/login_request_model.dart';
import 'package:bloc_cubit/login/model/login_response.dart';
import 'package:dio/dio.dart';

abstract class ILoginService {
  final Dio dio;

  ILoginService(this.dio);
  final String loginPath = ILoginServicePath.LOGIN.rawValue;

  Future<LoginResponeModel?> postUserLogin(LoginRequestModel model);
}

enum ILoginServicePath { LOGIN }

extension ILoginServicePathExtensions on ILoginServicePath {
  String get rawValue {
    switch (this) {
      case ILoginServicePath.LOGIN:
        return '/login';
    }
  }
}
