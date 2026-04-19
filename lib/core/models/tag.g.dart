// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TagImpl _$$TagImplFromJson(Map<String, dynamic> json) => _$TagImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      slug: json['slug'] as String,
      category: json['category'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$TagImplToJson(_$TagImpl instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'category': instance.category,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$TagsResponseImpl _$$TagsResponseImplFromJson(Map<String, dynamic> json) =>
    _$TagsResponseImpl(
      tags: (json['tags'] as List<dynamic>)
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TagsResponseImplToJson(_$TagsResponseImpl instance) =>
    <String, dynamic>{
      'tags': instance.tags,
    };
