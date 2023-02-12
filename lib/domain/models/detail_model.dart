import 'package:comento_task/domain/models/category_model.dart';
import 'package:comento_task/domain/models/reply_model.dart';
import 'package:comento_task/domain/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'detail_model.g.dart';

@JsonSerializable()
class DetailModel {
  final int? id;
  final String? title;
  final String? contents;
  final int? categoryId;
  final int? userId;
  final String? createdAt;
  final String? updatedAt;
  final CategoryModel? category;
  final List<ReplyModel>? reply;
  final UserModel? user;

  const DetailModel(
      {this.id,
      this.title,
      this.contents,
      this.categoryId,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.category,
      this.reply,
      this.user});

  factory DetailModel.fromJson(Map<String, dynamic> json) =>
      _$DetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$DetailModelToJson(this);
}
