import 'package:json_annotation/json_annotation.dart';

part 'data_list.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class DataList<T> {
  @JsonKey(name: 'category')
  final List<T> data;

  const DataList({required this.data});

  factory DataList.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$DataListFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$DataListToJson(this, toJsonT);
}
