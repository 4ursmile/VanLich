// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      userID: json['userID'] as String,
      id: json['id'] as String,
      contentID: json['contentID'] as String,
      text: json['text'] as String?,
      nOfLikes: json['nOfLikes'] as int? ?? 0,
      createDate: DateTime.parse(json['createDate'] as String),
      parentCommentIds: json['parentCommentIds'] as String?,
    )..nOfChildComments = json['nOfChildComments'] as int;

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'id': instance.id,
      'userID': instance.userID,
      'contentID': instance.contentID,
      'text': instance.text,
      'parentCommentIds': instance.parentCommentIds,
      'createDate': instance.createDate.toIso8601String(),
      'nOfLikes': instance.nOfLikes,
      'nOfChildComments': instance.nOfChildComments,
    };
