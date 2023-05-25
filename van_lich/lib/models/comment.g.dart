// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      userId: json['userId'] as String,
      commentId: json['commentId'] as String,
      contentId: json['contentId'] as String,
      text: json['text'] as String,
      likes: json['likes'] as int? ?? 0,
      dateTime: json['dateTime'] == null
          ? null
          : DateTime.parse(json['dateTime'] as String),
      rootCmt: (json['rootCmt'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'userId': instance.userId,
      'commentId': instance.commentId,
      'contentId': instance.contentId,
      'text': instance.text,
      'likes': instance.likes,
      'dateTime': instance.dateTime?.toIso8601String(),
      'rootCmt': instance.rootCmt,
    };
