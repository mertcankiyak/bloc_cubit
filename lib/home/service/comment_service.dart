import 'dart:convert';

import 'package:bloc_cubit/home/model/comment_model.dart';
import 'package:http/http.dart' as http;

class CommentService {
   Future<List<CommentModel>?> getComments(String api) async {
    var response = await http.get(Uri.parse('$api'));

    if (response.statusCode == 200) {
      print("veri geldi");
      return commentModelFromJson(response.body);
    } else {
      print("veri gelmedi");
    }
  }
}
