import 'package:json_annotation/json_annotation.dart';

part 'category_item_model.g.dart';

@JsonSerializable()
class CategoryItemModel {
  final int? id;
  final String? name;
  final String? createdAt;
  final String? updatedAt;

  const CategoryItemModel({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory CategoryItemModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryItemModelToJson(this);
}
