// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_panel_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnimePanelImageImpl _$$AnimePanelImageImplFromJson(
        Map<String, dynamic> json) =>
    _$AnimePanelImageImpl(
      id: json['id'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      cdnUrl: json['cdnUrl'] as String,
      sourceTitle: json['sourceTitle'] as String,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
    );

Map<String, dynamic> _$$AnimePanelImageImplToJson(
        _$AnimePanelImageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'thumbnailUrl': instance.thumbnailUrl,
      'cdnUrl': instance.cdnUrl,
      'sourceTitle': instance.sourceTitle,
      'tags': instance.tags,
    };

_$AnimePanelSearchResponseImpl _$$AnimePanelSearchResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AnimePanelSearchResponseImpl(
      query: json['query'] as String?,
      trending: json['trending'] as bool?,
      data: (json['data'] as List<dynamic>)
          .map((e) => AnimePanelImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AnimePanelSearchResponseImplToJson(
        _$AnimePanelSearchResponseImpl instance) =>
    <String, dynamic>{
      'query': instance.query,
      'trending': instance.trending,
      'data': instance.data,
    };
