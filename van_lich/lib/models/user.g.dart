// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      name: json['name'] as String? ?? '',
      email: json['email'] as String,
      password: json['password'] as String,
      avatarUrl: json['avatarUrl'] as String? ?? '',
      contentIds: (json['contentIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      favContentIds: (json['favContentIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      starContentIds: (json['starContentIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      saveContentIds: (json['saveContentIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      commentIds: (json['commentIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'avatarUrl': instance.avatarUrl,
      'contentIds': instance.contentIds,
      'favContentIds': instance.favContentIds,
      'starContentIds': instance.starContentIds,
      'saveContentIds': instance.saveContentIds,
      'commentIds': instance.commentIds,
    };
