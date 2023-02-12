import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class Data<T> {
  final T data;
  Data({required this.data});

  factory Data.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$DataFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$DataToJson(this, toJsonT);
}
