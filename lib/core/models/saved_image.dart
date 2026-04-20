import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_image.freezed.dart';
part 'saved_image.g.dart';

@freezed
class SavedImage with _$SavedImage {
  const factory SavedImage({
    required String id,
    required String imageUrl,
    required String thumbnailUrl,
    required String sourceTitle,
    required List<String> tags,
    required DateTime savedAt,
  }) = _SavedImage;

  factory SavedImage.fromJson(Map<String, dynamic> json) =>
      _$SavedImageFromJson(json);

  factory SavedImage.fromPanelImage(
    String imageId,
    String imageUrl,
    String thumbnailUrl,
    String sourceTitle,
    List<String> tags,
  ) {
    return SavedImage(
      id: imageId,
      imageUrl: imageUrl,
      thumbnailUrl: thumbnailUrl,
      sourceTitle: sourceTitle,
      tags: tags,
      savedAt: DateTime.now(),
    );
  }
}
