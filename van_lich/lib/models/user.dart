import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';
@JsonSerializable()
class User {
  String id = '';
  String userName = '';
  String email = '';
  String password = '';
  String avt = '';
  List<String> contents = [];
  List<String> favContents = [];
  List<String> starContents = [];
  List<String> savedContents = [];
  List<String> comments = [];

  User({
    required this.id,
    this.userName = '',
    required this.email,
    required this.password,
    this.avt = '',
    this.contents = const [],
    this.favContents = const [],
    this.starContents = const [],
    this.savedContents = const [],
    this.comments = const []
});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}


