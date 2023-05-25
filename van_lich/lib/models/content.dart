import 'package:json_annotation/json_annotation.dart';

part 'content.g.dart';
@JsonSerializable()
class Content {
  String contentId = '';
  String userId = '';
  String contentName = '';
  String caption = '';
  String description = '';
  String url = '';
  int numOfFavs = 0;
  int numOfStars = 0;
  int numOfCmts = 0;
  int numOfSaved = 0;
  int numOfShared = 0;

  Content({
    required this.contentId,
    required this.userId,
    required this.contentName,
    required this.caption,
    required this.description,
    required this.url,
    this.numOfFavs = 0,
    this.numOfCmts = 0,
    this.numOfSaved = 0,
    this.numOfShared = 0
});
  factory Content.fromJson(Map<String, dynamic> json) => _$ContentFromJson(json);

  Map<String, dynamic> toJson() => _$ContentToJson(this);
}