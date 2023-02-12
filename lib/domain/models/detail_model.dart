import 'package:comento_task/domain/models/category_item_model.dart';
import 'package:comento_task/domain/models/reply_model.dart';
import 'package:comento_task/domain/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'detail_model.g.dart';

@JsonSerializable()
class DetailModel {
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
  final CategoryModel category;
  final List<ReplyModel> reply;
  final UserModel user;

  const DetailModel(
      {required this.id,
      required this.title,
      required this.contents,
      required this.categoryId,
      required this.userId,
      required this.createdAt,
      required this.updatedAt,
      required this.category,
      required this.reply,
      required this.user});

  factory DetailModel.fromJson(Map<String, dynamic> json) =>
      _$DetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$DetailModelToJson(this);
}
