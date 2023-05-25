import 'package:json_annotation/json_annotation.dart';

part 'content.g.dart';
@JsonSerializable()
class Content {
  String id;
  bool debug;
  String name;
  String userID;
  String mainGraphicUrl;
  int nOfStars = 0;
  int nOfFavs = 0;
  int nOfComments = 0;
  int nOfShares = 0;
  String caption;
  String? description;
  String content;
  String? type;
  DateTime createDate;
  List<String> categories;
  List<String> graphics;

  Content({
    required this.id,
    required this.debug,
    required this.name,
    required this.userID,
    required this.mainGraphicUrl,
    this.nOfStars = 0,
    this.nOfShares = 0,
    this.nOfComments = 0,
    this.nOfFavs = 0,
    required this.caption,
    this.description,
    required this.content,
    this.type,
    required this.createDate,
    this.categories = const [],
    this.graphics = const [],


});
  factory Content.fromJson(Map<String, dynamic> json) => _$ContentFromJson(json);

  Map<String, dynamic> toJson() => _$ContentToJson(this);
}