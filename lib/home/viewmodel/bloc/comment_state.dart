part of 'comment_bloc.dart';

@immutable
abstract class CommentState extends Equatable {}

class CommentInitial extends CommentState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class CommentFetch extends CommentState {
  CommentFetch({required this.commentModel});
  List<CommentModel>? commentModel;

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class CommentLoading extends CommentState {
  bool isLoading;
  CommentLoading({required this.isLoading});
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
