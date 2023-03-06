import 'package:bloc_cubit/post/model/post_model.dart';
import 'package:dio/dio.dart';

abstract class IPostService {
  final Dio dio;
  Future<List<PostModel>?> fetchPosts();

  IPostService({required this.dio});
}

class PostService extends IPostService {
  PostService({required Dio dio}) : super(dio: dio);

  @override
  Future<List<PostModel>?> fetchPosts() async {
    Response response = await dio.get("/posts");
    print(response);
  }
}
