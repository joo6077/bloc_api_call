// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ads_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdsModel _$AdsModelFromJson(Map<String, dynamic> json) => AdsModel(
      id: json['id'] as int,
      title: json['title'] as String,
      contents: json['contents'] as String,
      img: json['img'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$AdsModelToJson(AdsModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'contents': instance.contents,
      'img': instance.img,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
