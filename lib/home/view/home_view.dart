import 'package:bloc_cubit/home/service/comment_service.dart';
import 'package:bloc_cubit/home/viewmodel/bloc/comment_bloc.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CommentService commentService = CommentService();
    return Scaffold(
      appBar: AppBar(
        title: Text("Home View"),
      ),
      body: BlocProvider(
        create: (context) => CommentBloc(commentService),
        child: BlocBuilder<CommentBloc, CommentState>(
          builder: (context, state) {
            if (state is CommentLoading) {
              print("commentloading içinde");
              return CircularProgressIndicator();
            } else if (state is CommentFetch) {
              print("CommentFetch içinde");
              return Column(
                children: [ElevatedButton(onPressed: () {}, child: Text("tıkla çek veriyi"))],
              );
            } else if (state is CommentInitial) {
              print("CommentInitial içinde");
              context.read<CommentBloc>().add(GetCommentEvent("https://jsonplaceholder.typicode.com/posts"));
              return CircularProgressIndicator();
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
