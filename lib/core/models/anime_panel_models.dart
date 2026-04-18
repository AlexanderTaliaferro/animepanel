import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_panel_models.freezed.dart';
part 'anime_panel_models.g.dart';

@freezed
class AnimePanelImage with _$AnimePanelImage {
  const factory AnimePanelImage({
    required String id,
    required String thumbnailUrl,
    required String cdnUrl,
    required String sourceTitle,
    @Default([]) List<String> tags,
  }) = _AnimePanelImage;

  factory AnimePanelImage.fromJson(Map<String, dynamic> json) =>
      _$AnimePanelImageFromJson(json);
}

@freezed
class AnimePanelSearchResponse with _$AnimePanelSearchResponse {
  const factory AnimePanelSearchResponse({
    String? query,
    bool? trending,
    required List<AnimePanelImage> data,
  }) = _AnimePanelSearchResponse;

  factory AnimePanelSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimePanelSearchResponseFromJson(json);
}
