import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';
@JsonSerializable()
class User {
  String id = '';
  String name = '';
  String email = '';
  String password = '';
  String avatarUrl = '';
  List<String> contentIds = [];
  List<String> favContentIds = [];
  List<String> starContentIds = [];
  List<String> saveContentIds = [];
  List<String> commentIds = [];

  User({
    required this.id,
    this.name = '',
    required this.email,
    required this.password,
    this.avatarUrl = '',
    this.contentIds = const [],
    this.favContentIds = const [],
    this.starContentIds = const [],
    this.saveContentIds = const [],
    this.commentIds = const []
});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}


