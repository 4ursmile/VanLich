import 'package:json_annotation/json_annotation.dart';

// string? id,
//     string name,
// string? userId,
//     string description,
// string thumbnail,
//     List<string?> contentIds)
part 'collection.g.dart';
@JsonSerializable()
class Collection {
  String id = '';
  String name = '';
  String userId = '';
  String description = '';
  String thumbnail = '';
  List<String> contentIds = [];

  Collection({
    required this.id,
    required this.name,
    required this.userId,
    this.description = '',
    this.thumbnail = '',
    this.contentIds = const [],
  });

  factory Collection.fromJson(Map<String, dynamic> json) => _$CollectionFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionToJson(this);

}
