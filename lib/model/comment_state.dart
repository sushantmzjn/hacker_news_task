
import 'package:hacker_news/model/comments.dart';

class CommentState{
  final bool isLoad;
  final bool isError;
  final String errorMessage;
  final List<Comments> comments;

  CommentState({
   required this.isLoad,
   required this.isError,
   required this.errorMessage,
   required this.comments});

  CommentState copyWith({
    bool? isLoad,
    bool? isError,
    String? errorMessage,
    List<Comments>? comments
}){
    return CommentState(
        isLoad: isLoad ?? this.isLoad,
        isError: isError ?? this.isError,
        errorMessage: errorMessage ?? this.errorMessage,
        comments: comments ?? this.comments
    );
  }
}