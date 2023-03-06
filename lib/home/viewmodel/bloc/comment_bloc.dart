import 'package:bloc/bloc.dart';
import 'package:bloc_cubit/home/model/comment_model.dart';
import 'package:bloc_cubit/home/service/comment_service.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentService commentService;
  CommentBloc(this.commentService) : super(CommentInitial()) {
    on<CommentEvent>((event, emit) async {
      if (event is GetCommentEvent) {
        List<CommentModel>? commentModel = await commentService.getComments(event.gelenApi);
        emit(CommentFetch(commentModel: commentModel));
      }
    });
  }
}
