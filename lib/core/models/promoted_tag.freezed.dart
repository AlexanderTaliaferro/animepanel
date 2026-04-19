// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promoted_tag.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PromotedTag _$PromotedTagFromJson(Map<String, dynamic> json) {
  return _PromotedTag.fromJson(json);
}

/// @nodoc
mixin _$PromotedTag {
  String get tagName => throw _privateConstructorUsedError;
  String get tagSlug => throw _privateConstructorUsedError;
  String? get previewImageId => throw _privateConstructorUsedError;
  String? get previewImageUrl => throw _privateConstructorUsedError;
  int get priority => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this PromotedTag to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PromotedTag
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PromotedTagCopyWith<PromotedTag> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromotedTagCopyWith<$Res> {
  factory $PromotedTagCopyWith(
          PromotedTag value, $Res Function(PromotedTag) then) =
      _$PromotedTagCopyWithImpl<$Res, PromotedTag>;
  @useResult
  $Res call(
      {String tagName,
      String tagSlug,
      String? previewImageId,
      String? previewImageUrl,
      int priority,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$PromotedTagCopyWithImpl<$Res, $Val extends PromotedTag>
    implements $PromotedTagCopyWith<$Res> {
  _$PromotedTagCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PromotedTag
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tagName = null,
    Object? tagSlug = null,
    Object? previewImageId = freezed,
    Object? previewImageUrl = freezed,
    Object? priority = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      tagName: null == tagName
          ? _value.tagName
          : tagName // ignore: cast_nullable_to_non_nullable
              as String,
      tagSlug: null == tagSlug
          ? _value.tagSlug
          : tagSlug // ignore: cast_nullable_to_non_nullable
              as String,
      previewImageId: freezed == previewImageId
          ? _value.previewImageId
          : previewImageId // ignore: cast_nullable_to_non_nullable
              as String?,
      previewImageUrl: freezed == previewImageUrl
          ? _value.previewImageUrl
          : previewImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PromotedTagImplCopyWith<$Res>
    implements $PromotedTagCopyWith<$Res> {
  factory _$$PromotedTagImplCopyWith(
          _$PromotedTagImpl value, $Res Function(_$PromotedTagImpl) then) =
      __$$PromotedTagImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String tagName,
      String tagSlug,
      String? previewImageId,
      String? previewImageUrl,
      int priority,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$PromotedTagImplCopyWithImpl<$Res>
    extends _$PromotedTagCopyWithImpl<$Res, _$PromotedTagImpl>
    implements _$$PromotedTagImplCopyWith<$Res> {
  __$$PromotedTagImplCopyWithImpl(
      _$PromotedTagImpl _value, $Res Function(_$PromotedTagImpl) _then)
      : super(_value, _then);

  /// Create a copy of PromotedTag
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tagName = null,
    Object? tagSlug = null,
    Object? previewImageId = freezed,
    Object? previewImageUrl = freezed,
    Object? priority = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$PromotedTagImpl(
      tagName: null == tagName
          ? _value.tagName
          : tagName // ignore: cast_nullable_to_non_nullable
              as String,
      tagSlug: null == tagSlug
          ? _value.tagSlug
          : tagSlug // ignore: cast_nullable_to_non_nullable
              as String,
      previewImageId: freezed == previewImageId
          ? _value.previewImageId
          : previewImageId // ignore: cast_nullable_to_non_nullable
              as String?,
      previewImageUrl: freezed == previewImageUrl
          ? _value.previewImageUrl
          : previewImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PromotedTagImpl implements _PromotedTag {
  const _$PromotedTagImpl(
      {required this.tagName,
      required this.tagSlug,
      this.previewImageId,
      this.previewImageUrl,
      this.priority = 0,
      this.createdAt,
      this.updatedAt});

  factory _$PromotedTagImpl.fromJson(Map<String, dynamic> json) =>
      _$$PromotedTagImplFromJson(json);

  @override
  final String tagName;
  @override
  final String tagSlug;
  @override
  final String? previewImageId;
  @override
  final String? previewImageUrl;
  @override
  @JsonKey()
  final int priority;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'PromotedTag(tagName: $tagName, tagSlug: $tagSlug, previewImageId: $previewImageId, previewImageUrl: $previewImageUrl, priority: $priority, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PromotedTagImpl &&
            (identical(other.tagName, tagName) || other.tagName == tagName) &&
            (identical(other.tagSlug, tagSlug) || other.tagSlug == tagSlug) &&
            (identical(other.previewImageId, previewImageId) ||
                other.previewImageId == previewImageId) &&
            (identical(other.previewImageUrl, previewImageUrl) ||
                other.previewImageUrl == previewImageUrl) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, tagName, tagSlug, previewImageId,
      previewImageUrl, priority, createdAt, updatedAt);

  /// Create a copy of PromotedTag
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PromotedTagImplCopyWith<_$PromotedTagImpl> get copyWith =>
      __$$PromotedTagImplCopyWithImpl<_$PromotedTagImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PromotedTagImplToJson(
      this,
    );
  }
}

abstract class _PromotedTag implements PromotedTag {
  const factory _PromotedTag(
      {required final String tagName,
      required final String tagSlug,
      final String? previewImageId,
      final String? previewImageUrl,
      final int priority,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$PromotedTagImpl;

  factory _PromotedTag.fromJson(Map<String, dynamic> json) =
      _$PromotedTagImpl.fromJson;

  @override
  String get tagName;
  @override
  String get tagSlug;
  @override
  String? get previewImageId;
  @override
  String? get previewImageUrl;
  @override
  int get priority;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of PromotedTag
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PromotedTagImplCopyWith<_$PromotedTagImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
