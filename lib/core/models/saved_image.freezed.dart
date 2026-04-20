// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SavedImage _$SavedImageFromJson(Map<String, dynamic> json) {
  return _SavedImage.fromJson(json);
}

/// @nodoc
mixin _$SavedImage {
  String get id => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get thumbnailUrl => throw _privateConstructorUsedError;
  String get sourceTitle => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  DateTime get savedAt => throw _privateConstructorUsedError;

  /// Serializes this SavedImage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SavedImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SavedImageCopyWith<SavedImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedImageCopyWith<$Res> {
  factory $SavedImageCopyWith(
          SavedImage value, $Res Function(SavedImage) then) =
      _$SavedImageCopyWithImpl<$Res, SavedImage>;
  @useResult
  $Res call(
      {String id,
      String imageUrl,
      String thumbnailUrl,
      String sourceTitle,
      List<String> tags,
      DateTime savedAt});
}

/// @nodoc
class _$SavedImageCopyWithImpl<$Res, $Val extends SavedImage>
    implements $SavedImageCopyWith<$Res> {
  _$SavedImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SavedImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageUrl = null,
    Object? thumbnailUrl = null,
    Object? sourceTitle = null,
    Object? tags = null,
    Object? savedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: null == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
      sourceTitle: null == sourceTitle
          ? _value.sourceTitle
          : sourceTitle // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      savedAt: null == savedAt
          ? _value.savedAt
          : savedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SavedImageImplCopyWith<$Res>
    implements $SavedImageCopyWith<$Res> {
  factory _$$SavedImageImplCopyWith(
          _$SavedImageImpl value, $Res Function(_$SavedImageImpl) then) =
      __$$SavedImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String imageUrl,
      String thumbnailUrl,
      String sourceTitle,
      List<String> tags,
      DateTime savedAt});
}

/// @nodoc
class __$$SavedImageImplCopyWithImpl<$Res>
    extends _$SavedImageCopyWithImpl<$Res, _$SavedImageImpl>
    implements _$$SavedImageImplCopyWith<$Res> {
  __$$SavedImageImplCopyWithImpl(
      _$SavedImageImpl _value, $Res Function(_$SavedImageImpl) _then)
      : super(_value, _then);

  /// Create a copy of SavedImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageUrl = null,
    Object? thumbnailUrl = null,
    Object? sourceTitle = null,
    Object? tags = null,
    Object? savedAt = null,
  }) {
    return _then(_$SavedImageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: null == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
      sourceTitle: null == sourceTitle
          ? _value.sourceTitle
          : sourceTitle // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      savedAt: null == savedAt
          ? _value.savedAt
          : savedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SavedImageImpl implements _SavedImage {
  const _$SavedImageImpl(
      {required this.id,
      required this.imageUrl,
      required this.thumbnailUrl,
      required this.sourceTitle,
      required final List<String> tags,
      required this.savedAt})
      : _tags = tags;

  factory _$SavedImageImpl.fromJson(Map<String, dynamic> json) =>
      _$$SavedImageImplFromJson(json);

  @override
  final String id;
  @override
  final String imageUrl;
  @override
  final String thumbnailUrl;
  @override
  final String sourceTitle;
  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final DateTime savedAt;

  @override
  String toString() {
    return 'SavedImage(id: $id, imageUrl: $imageUrl, thumbnailUrl: $thumbnailUrl, sourceTitle: $sourceTitle, tags: $tags, savedAt: $savedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavedImageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.sourceTitle, sourceTitle) ||
                other.sourceTitle == sourceTitle) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.savedAt, savedAt) || other.savedAt == savedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, imageUrl, thumbnailUrl,
      sourceTitle, const DeepCollectionEquality().hash(_tags), savedAt);

  /// Create a copy of SavedImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SavedImageImplCopyWith<_$SavedImageImpl> get copyWith =>
      __$$SavedImageImplCopyWithImpl<_$SavedImageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SavedImageImplToJson(
      this,
    );
  }
}

abstract class _SavedImage implements SavedImage {
  const factory _SavedImage(
      {required final String id,
      required final String imageUrl,
      required final String thumbnailUrl,
      required final String sourceTitle,
      required final List<String> tags,
      required final DateTime savedAt}) = _$SavedImageImpl;

  factory _SavedImage.fromJson(Map<String, dynamic> json) =
      _$SavedImageImpl.fromJson;

  @override
  String get id;
  @override
  String get imageUrl;
  @override
  String get thumbnailUrl;
  @override
  String get sourceTitle;
  @override
  List<String> get tags;
  @override
  DateTime get savedAt;

  /// Create a copy of SavedImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SavedImageImplCopyWith<_$SavedImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
