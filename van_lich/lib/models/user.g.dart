// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      userName: json['userName'] as String? ?? '',
      email: json['email'] as String,
      password: json['password'] as String,
      avt: json['avt'] as String? ?? '',
      contents: (json['contents'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      favContents: (json['favContents'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      starContents: (json['starContents'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      savedContents: (json['savedContents'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      comments: (json['comments'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'email': instance.email,
      'password': instance.password,
      'avt': instance.avt,
      'contents': instance.contents,
      'favContents': instance.favContents,
      'starContents': instance.starContents,
      'savedContents': instance.savedContents,
      'comments': instance.comments,
    };
