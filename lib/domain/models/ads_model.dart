import 'package:json_annotation/json_annotation.dart';

part 'ads_model.g.dart';

@JsonSerializable()
class AdsModel {
  final int? id;
  final String? title;
  final String? contents;
  final String? img;
  final String? createdAt;
  final String? updatedAt;

  const AdsModel(
      {this.id,
      this.title,
      this.contents,
      this.img,
      this.createdAt,
      this.updatedAt});

  factory AdsModel.fromJson(Map<String, dynamic> json) =>
      _$AdsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdsModelToJson(this);
}
