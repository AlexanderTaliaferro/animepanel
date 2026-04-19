import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag.freezed.dart';
part 'tag.g.dart';

@freezed
class Tag with _$Tag {
  const factory Tag({
    required String id,
    required String name,
    required String slug,
    required String category,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Tag;

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
}

@freezed
class TagsResponse with _$TagsResponse {
  const factory TagsResponse({
    required List<Tag> tags,
  }) = _TagsResponse;

  factory TagsResponse.fromJson(Map<String, dynamic> json) =>
      _$TagsResponseFromJson(json);
}
