import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';
@JsonSerializable()
class Comment {
  String id;
  String userID;
  String contentID;
  String? text;
  String? parentCommentIds;
  DateTime createDate;
  int nOfLikes = 0;
  int nOfChildComments = 0;

  Comment({
    required this.userID,
    required this.id,
    required this.contentID,
    this.text,
    this.nOfLikes = 0,
    required this.createDate,
    this.parentCommentIds
});
  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}