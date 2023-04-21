// To parse this JSON data, do
//
//     final story = storyFromJson(jsonString);

// import 'dart:convert';
//
// List<int> storyFromJson(String str) => List<int>.from(json.decode(str).map((x) => x));
//
// String storyToJson(List<int> data) => json.encode(List<dynamic>.from(data.map((x) => x)));

class Story {
  final int id;

  Story({required this.id});

  factory Story.fromJson(Map<String, dynamic> json){
    return Story(id: json['id']??'');
  }
}
