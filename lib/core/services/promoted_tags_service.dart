import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/promoted_tag.dart';

class PromotedTagsService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Fetch all promoted tags from a specific category
  Future<List<PromotedTag>> fetchPromotedTags(String category) async {
    try {
      final snapshot = await _firestore
          .collection('tags')
          .doc('promoted_tags')
          .collection(category)
          .orderBy('priority', descending: false)
          .get();

      return snapshot.docs
          .map((doc) => PromotedTag.fromFirestore(doc))
          .toList();
    } catch (e) {
      print('[PromotedTagsService] ERROR fetching $category: $e');
      // Return empty list on error
      return [];
    }
  }

  /// Fetch promoted tags from multiple categories
  Future<Map<String, List<PromotedTag>>> fetchAllCategories(
      List<String> categories) async {
    final results = <String, List<PromotedTag>>{};

    for (final category in categories) {
      results[category] = await fetchPromotedTags(category);
    }

    return results;
  }
}
