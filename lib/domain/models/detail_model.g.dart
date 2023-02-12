// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailModel _$DetailModelFromJson(Map<String, dynamic> json) => DetailModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      contents: json['contents'] as String?,
      categoryId: json['categoryId'] as int?,
      userId: json['userId'] as int?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      category: json['category'] == null
          ? null
          : CategoryItemModel.fromJson(
              json['category'] as Map<String, dynamic>),
      reply: (json['reply'] as List<dynamic>?)
          ?.map((e) => ReplyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetailModelToJson(DetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'contents': instance.contents,
      'categoryId': instance.categoryId,
      'userId': instance.userId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'category': instance.category,
      'reply': instance.reply,
      'user': instance.user,
    };
