import 'package:bloc_cubit/post/core/network/network_manager.dart';
import 'package:bloc_cubit/post/service/post_service.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class PostView extends StatelessWidget {
  PostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post View"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () async {
                // PostService postService = PostService(dio: NetworkManager().dio);

                // await postService.fetchPosts();

                NetworkManager networkManager1 = NetworkManager.instance;
                NetworkManager networkManager2 = NetworkManager.instance;
                print(networkManager1 == networkManager2);
              },
              child: Text("veriyi getir"))
        ],
      ),
    );
  }
}
