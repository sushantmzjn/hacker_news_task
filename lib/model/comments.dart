
class Comments{
  final int id;
  final String text;
  final String by;

  Comments({
   required this.id,
   required this.text,
   required this.by});

  factory Comments.fromJson(Map<String, dynamic> json){
    return Comments(
        id: json['id']??'',
        text: json['text']??'',
        by: json['by']??''
    );
  }
}