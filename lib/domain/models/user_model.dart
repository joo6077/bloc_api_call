import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  int id;
  String name;
  String email;
  @JsonKey(name: 'email_verified_at')
  String emailVerifiedAt;
  @JsonKey(name: 'created_at')
  String createdAt;
  @JsonKey(name: 'updated_at')
  String updatedAt;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.emailVerifiedAt,
      required this.createdAt,
      required this.updatedAt});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
