import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/promoted_tag.dart';
import '../services/promoted_tags_service.dart';

part 'promoted_tags_provider.g.dart';

/// Categories to fetch from Firestore
const _categories = ['reactions', 'moods', 'themes'];

@Riverpod(keepAlive: true)
class PromotedTagsNotifier extends _$PromotedTagsNotifier {
  final _service = PromotedTagsService();

  @override
  Future<Map<String, List<PromotedTag>>> build() async {
    // Fetch all promoted tags on app load
    return await _service.fetchAllCategories(_categories);
  }

  /// Get tags for a specific category
  List<PromotedTag> getCategory(String category) {
    return state.valueOrNull?[category] ?? [];
  }

  /// Get all reaction tags (for backwards compatibility)
  List<PromotedTag> getReactionTags() {
    return getCategory('reactions');
  }
}
