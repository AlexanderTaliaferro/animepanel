abstract class AppConstants {
  static const animePanelBaseUrl =
      'https://anime-panel-api.animepanel.workers.dev';

  /// Top 10 reaction tags with preview images
  /// imageUrl should be the most copied image for that tag
  static const List<TagSuggestion> suggestedTags = [
    TagSuggestion(label: 'Shocked', slug: 'shocked', imageUrl: ''),
    TagSuggestion(label: 'Crying', slug: 'crying', imageUrl: ''),
    TagSuggestion(label: 'Laughing', slug: 'laughing', imageUrl: ''),
    TagSuggestion(label: 'Angry', slug: 'angry', imageUrl: ''),
    TagSuggestion(label: 'Smug', slug: 'smug', imageUrl: ''),
    TagSuggestion(label: 'Happy', slug: 'happy', imageUrl: ''),
    TagSuggestion(label: 'Sad', slug: 'sad', imageUrl: ''),
    TagSuggestion(label: 'Surprised', slug: 'surprised', imageUrl: ''),
    TagSuggestion(label: 'Confused', slug: 'confused', imageUrl: ''),
    TagSuggestion(label: 'Embarrassed', slug: 'embarrassed', imageUrl: ''),
  ];
}

class TagSuggestion {
  final String label;
  final String slug;
  final String imageUrl;
  const TagSuggestion({
    required this.label,
    required this.slug,
    required this.imageUrl,
  });
}
