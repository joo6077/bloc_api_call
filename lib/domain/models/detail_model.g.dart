// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailModel _$DetailModelFromJson(Map<String, dynamic> json) => DetailModel(
      id: json['id'] as int,
      title: json['title'] as String,
      contents: json['contents'] as String,
      categoryId: json['category_id'] as int,
      userId: json['user_id'] as int,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      category:
          CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      reply: (json['reply'] as List<dynamic>)
          .map((e) => ReplyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetailModelToJson(DetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'contents': instance.contents,
      'category_id': instance.categoryId,
      'user_id': instance.userId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'category': instance.category,
      'reply': instance.reply,
      'user': instance.user,
    };
