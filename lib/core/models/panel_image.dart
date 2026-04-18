import 'anime_panel_models.dart';

class PanelImage {
  final String id;
  final String imageUrl;
  final String thumbnailUrl;
  final String sourceTitle;
  final List<String> tags;

  const PanelImage({
    required this.id,
    required this.imageUrl,
    required this.thumbnailUrl,
    required this.sourceTitle,
    required this.tags,
  });

  factory PanelImage.fromAnimePanel(AnimePanelImage img) => PanelImage(
        id: img.id,
        imageUrl: img.cdnUrl,
        thumbnailUrl: img.thumbnailUrl,
        sourceTitle: img.sourceTitle,
        tags: img.tags,
      );
}
