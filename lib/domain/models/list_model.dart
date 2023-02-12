import 'package:json_annotation/json_annotation.dart';

part 'list_model.g.dart';

@JsonSerializable()
class ListModel {
  final int? id;
  final String? title;
  final String? contents;
  final int? categoryId;
  final int? userId;
  final String? createdAt;
  final String? updatedAt;

  const ListModel(
      {this.id,
      this.title,
      this.contents,
      this.categoryId,
      this.userId,
      this.createdAt,
      this.updatedAt});

  factory ListModel.fromJson(Map<String, dynamic> json) =>
      _$ListModelFromJson(json);

  Map<String, dynamic> toJson() => _$ListModelToJson(this);
}
