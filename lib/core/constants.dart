abstract class AppConstants {
  static const animePanelBaseUrl =
      'https://anime-panel-api.animepanel.workers.dev';

  /// Suggested tag chips shown on the idle home screen.
  /// These are the most popular slugs in the AnimePanel database.
  static const List<TagSuggestion> suggestedTags = [
    TagSuggestion(label: '😤 Shocked', slug: 'shocked'),
    TagSuggestion(label: '😭 Crying', slug: 'crying'),
    TagSuggestion(label: '😂 Laughing', slug: 'laughing'),
    TagSuggestion(label: '😡 Angry', slug: 'angry'),
    TagSuggestion(label: '😏 Smug', slug: 'smug'),
    TagSuggestion(label: '😳 Flustered', slug: 'flustered'),
    TagSuggestion(label: '😨 Nervous', slug: 'nervous'),
    TagSuggestion(label: '🤢 Disgusted', slug: 'disgusted'),
    TagSuggestion(label: '😊 Happy', slug: 'happy'),
    TagSuggestion(label: '😢 Sad', slug: 'sad'),
    TagSuggestion(label: '😮 Surprised', slug: 'surprised'),
    TagSuggestion(label: '😎 Proud', slug: 'proud'),
    TagSuggestion(label: '🥺 Desperate', slug: 'desperate'),
    TagSuggestion(label: '😴 Tired', slug: 'tired'),
    TagSuggestion(label: '❓ Confused', slug: 'confused'),
    TagSuggestion(label: '💀 Dead Inside', slug: 'dead-inside'),
  ];
}

class TagSuggestion {
  final String label;
  final String slug;
  const TagSuggestion({required this.label, required this.slug});
}
