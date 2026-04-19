// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promoted_tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PromotedTagImpl _$$PromotedTagImplFromJson(Map<String, dynamic> json) =>
    _$PromotedTagImpl(
      tagName: json['tagName'] as String,
      tagSlug: json['tagSlug'] as String,
      previewImageId: json['previewImageId'] as String?,
      previewImageUrl: json['previewImageUrl'] as String?,
      priority: (json['priority'] as num?)?.toInt() ?? 0,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$PromotedTagImplToJson(_$PromotedTagImpl instance) =>
    <String, dynamic>{
      'tagName': instance.tagName,
      'tagSlug': instance.tagSlug,
      'previewImageId': instance.previewImageId,
      'previewImageUrl': instance.previewImageUrl,
      'priority': instance.priority,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
