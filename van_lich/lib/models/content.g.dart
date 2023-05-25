// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      contentId: json['contentId'] as String,
      userId: json['userId'] as String,
      contentName: json['contentName'] as String,
      caption: json['caption'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      numOfFavs: json['numOfFavs'] as int? ?? 0,
      numOfCmts: json['numOfCmts'] as int? ?? 0,
      numOfSaved: json['numOfSaved'] as int? ?? 0,
      numOfShared: json['numOfShared'] as int? ?? 0,
    )..numOfStars = json['numOfStars'] as int;

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'contentId': instance.contentId,
      'userId': instance.userId,
      'contentName': instance.contentName,
      'caption': instance.caption,
      'description': instance.description,
      'url': instance.url,
      'numOfFavs': instance.numOfFavs,
      'numOfStars': instance.numOfStars,
      'numOfCmts': instance.numOfCmts,
      'numOfSaved': instance.numOfSaved,
      'numOfShared': instance.numOfShared,
    };
