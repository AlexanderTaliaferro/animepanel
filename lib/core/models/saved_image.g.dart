// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SavedImageImpl _$$SavedImageImplFromJson(Map<String, dynamic> json) =>
    _$SavedImageImpl(
      id: json['id'] as String,
      imageUrl: json['imageUrl'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      sourceTitle: json['sourceTitle'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      savedAt: DateTime.parse(json['savedAt'] as String),
    );

Map<String, dynamic> _$$SavedImageImplToJson(_$SavedImageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'thumbnailUrl': instance.thumbnailUrl,
      'sourceTitle': instance.sourceTitle,
      'tags': instance.tags,
      'savedAt': instance.savedAt.toIso8601String(),
    };
