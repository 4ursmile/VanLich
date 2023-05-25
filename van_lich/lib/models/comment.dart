import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';
@JsonSerializable()
class Comment {
  String userId = '';
  String commentId = '';
  String contentId = '';
  String text = '';
  int likes = 0;
  DateTime? dateTime;
  Map<String, String>? rootCmt;

  Comment({
    required this.userId,
    required this.commentId,
    required this.contentId,
    required this.text,
    this.likes = 0,
    this.dateTime,
    this.rootCmt

});
  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}