// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'panels_desu_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PanelsDesuResponseImpl _$$PanelsDesuResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PanelsDesuResponseImpl(
      panels: (json['panels'] as List<dynamic>)
          .map((e) => PanelsDesuPanel.fromJson(e as Map<String, dynamic>))
          .toList(),
      manga: (json['manga'] as List<dynamic>)
          .map((e) => PanelsDesuManga.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PanelsDesuResponseImplToJson(
        _$PanelsDesuResponseImpl instance) =>
    <String, dynamic>{
      'panels': instance.panels,
      'manga': instance.manga,
    };

_$PanelsDesuPanelImpl _$$PanelsDesuPanelImplFromJson(
        Map<String, dynamic> json) =>
    _$PanelsDesuPanelImpl(
      id: json['id'] as String,
      mangaId: json['mangaId'] as String,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$$PanelsDesuPanelImplToJson(
        _$PanelsDesuPanelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mangaId': instance.mangaId,
      'imageUrl': instance.imageUrl,
    };

_$PanelsDesuMangaImpl _$$PanelsDesuMangaImplFromJson(
        Map<String, dynamic> json) =>
    _$PanelsDesuMangaImpl(
      id: json['id'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$$PanelsDesuMangaImplToJson(
        _$PanelsDesuMangaImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
