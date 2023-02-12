import 'package:json_annotation/json_annotation.dart';

part 'ads_model.g.dart';

@JsonSerializable()
class AdsModel {
  final int id;
  final String title;
  final String contents;
  final String img;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  const AdsModel(
      {required this.id,
      required this.title,
      required this.contents,
      required this.img,
      required this.createdAt,
      required this.updatedAt});

  factory AdsModel.fromJson(Map<String, dynamic> json) =>
      _$AdsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdsModelToJson(this);
}
