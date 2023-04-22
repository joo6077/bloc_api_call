import 'package:bloc_api_call/domain/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reply_model.g.dart';

@JsonSerializable()
class ReplyModel {
  final int id;
  @JsonKey(name: 'user_id')
  final int userId;
  final int parent;
  final String contents;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  final UserModel user;

  const ReplyModel(
      {required this.id,
      required this.userId,
      required this.parent,
      required this.contents,
      required this.createdAt,
      required this.updatedAt,
      required this.user});

  factory ReplyModel.fromJson(Map<String, dynamic> json) =>
      _$ReplyModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReplyModelToJson(this);
}
