// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinkModel _$LinkModelFromJson(Map<String, dynamic> json) => LinkModel(
      url: json['url'] as String?,
      label: json['label'],
      active: json['active'] as bool,
    );

Map<String, dynamic> _$LinkModelToJson(LinkModel instance) => <String, dynamic>{
      'url': instance.url,
      'label': instance.label,
      'active': instance.active,
    };
