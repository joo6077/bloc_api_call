import 'package:comento_task/domain/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reply_model.g.dart';

@JsonSerializable()
class ReplyModel {
  final int? id;
  final int? userId;
  final int? parent;
  final String? contents;
  final String? createdAt;
  final String? updatedAt;
  final UserModel? user;

  const ReplyModel(
      {this.id,
      this.userId,
      this.parent,
      this.contents,
      this.createdAt,
      this.updatedAt,
      this.user});

  factory ReplyModel.fromJson(Map<String, dynamic> json) =>
      _$ReplyModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReplyModelToJson(this);
}
