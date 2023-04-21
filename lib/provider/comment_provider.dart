//
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:hacker_news/model/comment_state.dart';
// import 'package:hacker_news/services/comments_services.dart';
// import 'package:hacker_news/services/stories_services.dart';
//
// final commentProvider =StateNotifierProvider<GetComments, CommentState>((ref) => GetComments(CommentState(
//   isError: false,
//   isLoad: false, errorMessage: '', comments: []
// )));
//
// class GetComments extends StateNotifier<CommentState>{
//   GetComments(super.state);
//
//   Future<void> getComments({required int id})async{
//     state = state.copyWith(isLoad: true,isError: false);
//     final res = await CommentServices.getComments(id: id);
//     res.fold(
//             (l) {
//               state = state.copyWith(isLoad: false, isError: true, errorMessage: l);
//             },
//             (r) {
//               state = state.copyWith(isLoad: false, isError: false, errorMessage: '', comments: r);
//             }
//     );
//
//   }
//
// }