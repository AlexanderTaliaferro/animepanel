import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'promoted_tag.freezed.dart';
part 'promoted_tag.g.dart';

@freezed
class PromotedTag with _$PromotedTag {
  const factory PromotedTag({
    required String tagName,
    required String tagSlug,
    String? previewImageId,
    String? previewImageUrl,
    @Default(0) int priority,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _PromotedTag;

  factory PromotedTag.fromJson(Map<String, dynamic> json) =>
      _$PromotedTagFromJson(json);

  factory PromotedTag.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return PromotedTag(
      tagName: data['tagName'] as String,
      tagSlug: data['tagSlug'] as String,
      previewImageId: data['previewImageId'] as String?,
      previewImageUrl: data['previewImageUrl'] as String?,
      priority: data['priority'] as int? ?? 0,
      createdAt: (data['createdAt'] as Timestamp?)?.toDate(),
      updatedAt: (data['updatedAt'] as Timestamp?)?.toDate(),
    );
  }
}
