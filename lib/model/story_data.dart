import 'package:hacker_news/model/comments.dart';

class StoryData {
  StoryData({
    required this.by,
    required this.id,
    required this.kids,
    required this.title,

  });
   final String by;
   final int id;
   final List<int> kids;
   final String title;

 factory StoryData.fromJson(Map<String, dynamic> json){
   return StoryData(
       by: json['by']??'',
       id: json['id']??'',
       kids: json['kids']??'',
       title: json['title']??'',

   );
  }

}