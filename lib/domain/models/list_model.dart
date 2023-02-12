import 'package:json_annotation/json_annotation.dart';

part 'list_model.g.dart';

@JsonSerializable()
class ListModel {
  final int id;
  final String title;
  final String contents;
  @JsonKey(name: 'category_id')
  final int categoryId;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  const ListModel(
      {required this.id,
      required this.title,
      required this.contents,
      required this.categoryId,
      required this.userId,
      required this.createdAt,
      required this.updatedAt});

  factory ListModel.fromJson(Map<String, dynamic> json) =>
      _$ListModelFromJson(json);

  Map<String, dynamic> toJson() => _$ListModelToJson(this);
}
