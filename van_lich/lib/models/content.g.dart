// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      id: json['id'] as String,
      debug: json['debug'] as bool? ?? false,
      name: json['name'] as String,
      userID: json['userID'] as String,
      mainGraphicUrl: json['mainGraphicUrl'] as String,
      nOfStars: json['nOfStars'] as int? ?? 0,
      nOfShares: json['nOfShares'] as int? ?? 0,
      nOfComments: json['nOfComments'] as int? ?? 0,
      nOfFavs: json['nOfFavs'] as int? ?? 0,
      caption: json['caption'] as String,
      description: json['description'] as String?,
      content: json['content'] as String,
      type: json['type'] as String?,
      createDate: DateTime.parse(json['createDate'] as String),
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      graphics: (json['graphics'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'id': instance.id,
      'debug': instance.debug,
      'name': instance.name,
      'userID': instance.userID,
      'mainGraphicUrl': instance.mainGraphicUrl,
      'nOfStars': instance.nOfStars,
      'nOfFavs': instance.nOfFavs,
      'nOfComments': instance.nOfComments,
      'nOfShares': instance.nOfShares,
      'caption': instance.caption,
      'description': instance.description,
      'content': instance.content,
      'type': instance.type,
      'createDate': instance.createDate.toIso8601String(),
      'categories': instance.categories,
      'graphics': instance.graphics,
    };
