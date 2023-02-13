import 'package:json_annotation/json_annotation.dart';

part 'link_model.g.dart';

@JsonSerializable()
class LinkModel {
  final String? url;
  final dynamic label;
  final bool active;

  const LinkModel({required this.url, this.label, required this.active});

  factory LinkModel.fromJson(Map<String, dynamic> json) =>
      _$LinkModelFromJson(json);

  Map<String, dynamic> toJson() => _$LinkModelToJson(this);
}
