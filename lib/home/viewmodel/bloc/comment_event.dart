part of 'comment_bloc.dart';

@immutable
abstract class CommentEvent extends Equatable {
  const CommentEvent();
}

class GetCommentEvent extends CommentEvent {
  String gelenApi;
  GetCommentEvent(this.gelenApi);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
