// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationModel<T> _$PaginationModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PaginationModel<T>(
      currentPage: json['current_page'] as int,
      data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
      firstPageUrl: json['first_page_url'] as String,
      from: json['from'] as int?,
      lastPage: json['last_page'] as int,
      lastPageUrl: json['last_page_url'] as String,
      links: (json['links'] as List<dynamic>)
          .map((e) => LinkModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageUrl: json['next_page_url'] as String?,
      path: json['path'] as String,
      perPage: json['per_page'] as int,
      prevPageUrl: json['prev_page_url'] as String?,
      to: json['to'] as int?,
      total: json['total'] as int,
    );

Map<String, dynamic> _$PaginationModelToJson<T>(
  PaginationModel<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'data': instance.data.map(toJsonT).toList(),
      'first_page_url': instance.firstPageUrl,
      'from': instance.from,
      'last_page': instance.lastPage,
      'last_page_url': instance.lastPageUrl,
      'links': instance.links,
      'next_page_url': instance.nextPageUrl,
      'path': instance.path,
      'per_page': instance.perPage,
      'prev_page_url': instance.prevPageUrl,
      'to': instance.to,
      'total': instance.total,
    };
