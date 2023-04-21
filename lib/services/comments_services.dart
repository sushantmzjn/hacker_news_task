import 'dart:core';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hacker_news/api_exception.dart';
import 'package:hacker_news/model/comments.dart';


final commentsProvider = FutureProvider.family((ref, List<int> ids) => CommentServices.getComments(ids: ids));

class CommentServices {
  static Dio dio = Dio();

  static Future<List<Comments>> getComments({required List<int> ids}) async {
    try {
      List<Comments> comments = [];

      // for(final c in ids){
      //   final res = await dio.get('https://hacker-news.firebaseio.com/v0/item/$c.json');
      //   comments.add(Comments.fromJson(res.data));
      //
      // }


     await Future.forEach(ids.take(10),(e) async {
        final res = await dio.get('https://hacker-news.firebaseio.com/v0/item/$e.json');
       
        comments.add(Comments.fromJson(res.data));
        // print(res.data);

      });

      // print(comments);
      return comments;
    } on DioError catch (err) {
      print(err);
      throw DioException.getDioError(err);
    }
  }
}
