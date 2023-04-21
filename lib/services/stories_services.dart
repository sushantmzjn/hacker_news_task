import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hacker_news/api_exception.dart';
import 'package:hacker_news/model/comments.dart';
import 'package:hacker_news/model/story.dart';

import '../model/story_data.dart';

final story =FutureProvider((ref) => StoryServices.getStoryId());

class StoryServices {
  static Dio dio = Dio();

  static Future<List<StoryData>> getStoryId() async {
    try {
      final response = await dio.get('https://hacker-news.firebaseio.com/v0/topstories.json');
      final storyIds = (response.data as List).take(15).toList();
      List<StoryData> stories = [];

      for(final storyId in storyIds){
        final storyResponse = await dio.get('https://hacker-news.firebaseio.com/v0/item/$storyId.json');
        final storyData = storyResponse.data;
        final story = StoryData(
            by: storyData['by']??'',
            id: storyData['id']??'',
            kids: List<int>.from(storyData['kids'] ?? []),
            title: storyData['title']??'',
        );
        stories.add(story);
        }

      return stories;
    } on DioError catch (err) {
      print(err);
      throw DioException.getDioError(err);
    }
  }

}
