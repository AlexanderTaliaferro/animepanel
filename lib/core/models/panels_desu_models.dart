import 'package:freezed_annotation/freezed_annotation.dart';

part 'panels_desu_models.freezed.dart';
part 'panels_desu_models.g.dart';

/// Response from PanelsDesu API /v1/search endpoint
@freezed
class PanelsDesuResponse with _$PanelsDesuResponse {
  const PanelsDesuResponse._();

  const factory PanelsDesuResponse({
    required List<PanelsDesuPanel> panels,
    required List<PanelsDesuManga> manga,
  }) = _PanelsDesuResponse;

  /// Helper: look up manga by ID for display title
  Map<String, PanelsDesuManga> get mangaById =>
      Map.fromEntries(manga.map((m) => MapEntry(m.id, m)));

  factory PanelsDesuResponse.fromJson(Map<String, dynamic> json) =>
      _$PanelsDesuResponseFromJson(json);
}

@freezed
class PanelsDesuPanel with _$PanelsDesuPanel {
  const factory PanelsDesuPanel({
    required String id,
    required String mangaId,
    required String imageUrl,
  }) = _PanelsDesuPanel;

  factory PanelsDesuPanel.fromJson(Map<String, dynamic> json) =>
      _$PanelsDesuPanelFromJson({
        'id': json['id'],
        'mangaId': json['manga_id'],
        'imageUrl': json['image_url'],
      });
}

@freezed
class PanelsDesuManga with _$PanelsDesuManga {
  const factory PanelsDesuManga({
    required String id,
    required String title,
  }) = _PanelsDesuManga;

  const PanelsDesuManga._();

  String get displayTitle => title;

  factory PanelsDesuManga.fromJson(Map<String, dynamic> json) =>
      _$PanelsDesuMangaFromJson(json);
}
