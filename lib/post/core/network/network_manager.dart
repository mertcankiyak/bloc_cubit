import 'package:dio/dio.dart';

// class NetworkManager {
//   static final NetworkManager _instance = NetworkManager._internal();
//   late Dio dio;

//   factory NetworkManager() {
//     return _instance;
//   }

//   NetworkManager._internal() {
//     var baseOptions = BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com");
//     dio = Dio(baseOptions);
//   }
// }

class NetworkManager {
  static final NetworkManager _instance = NetworkManager._internal();

  static NetworkManager get instance => _instance;

  NetworkManager._internal();
}
