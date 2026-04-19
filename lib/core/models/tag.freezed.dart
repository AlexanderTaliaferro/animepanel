// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tag.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Tag _$TagFromJson(Map<String, dynamic> json) {
  return _Tag.fromJson(json);
}

/// @nodoc
mixin _$Tag {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Tag to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Tag
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TagCopyWith<Tag> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagCopyWith<$Res> {
  factory $TagCopyWith(Tag value, $Res Function(Tag) then) =
      _$TagCopyWithImpl<$Res, Tag>;
  @useResult
  $Res call(
      {String id,
      String name,
      String slug,
      String category,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$TagCopyWithImpl<$Res, $Val extends Tag> implements $TagCopyWith<$Res> {
  _$TagCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Tag
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = null,
    Object? category = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$TagImplCopyWith<$Res> implements $TagCopyWith<$Res> {
  factory _$$TagImplCopyWith(_$TagImpl value, $Res Function(_$TagImpl) then) =
      __$$TagImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String slug,
      String category,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$TagImplCopyWithImpl<$Res> extends _$TagCopyWithImpl<$Res, _$TagImpl>
    implements _$$TagImplCopyWith<$Res> {
  __$$TagImplCopyWithImpl(_$TagImpl _value, $Res Function(_$TagImpl) _then)
      : super(_value, _then);

  /// Create a copy of Tag
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = null,
    Object? category = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$TagImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$TagImpl implements _Tag {
  const _$TagImpl(
      {required this.id,
      required this.name,
      required this.slug,
      required this.category,
      this.createdAt,
      this.updatedAt});

  factory _$TagImpl.fromJson(Map<String, dynamic> json) =>
      _$$TagImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String slug;
  @override
  final String category;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Tag(id: $id, name: $name, slug: $slug, category: $category, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TagImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, slug, category, createdAt, updatedAt);

  /// Create a copy of Tag
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TagImplCopyWith<_$TagImpl> get copyWith =>
      __$$TagImplCopyWithImpl<_$TagImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TagImplToJson(
      this,
    );
  }
}

abstract class _Tag implements Tag {
  const factory _Tag(
      {required final String id,
      required final String name,
      required final String slug,
      required final String category,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$TagImpl;

  factory _Tag.fromJson(Map<String, dynamic> json) = _$TagImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get slug;
  @override
  String get category;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Tag
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TagImplCopyWith<_$TagImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TagsResponse _$TagsResponseFromJson(Map<String, dynamic> json) {
  return _TagsResponse.fromJson(json);
}

/// @nodoc
mixin _$TagsResponse {
  List<Tag> get tags => throw _privateConstructorUsedError;

  /// Serializes this TagsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TagsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TagsResponseCopyWith<TagsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagsResponseCopyWith<$Res> {
  factory $TagsResponseCopyWith(
          TagsResponse value, $Res Function(TagsResponse) then) =
      _$TagsResponseCopyWithImpl<$Res, TagsResponse>;
  @useResult
  $Res call({List<Tag> tags});
}

/// @nodoc
class _$TagsResponseCopyWithImpl<$Res, $Val extends TagsResponse>
    implements $TagsResponseCopyWith<$Res> {
  _$TagsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TagsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tags = null,
  }) {
    return _then(_value.copyWith(
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TagsResponseImplCopyWith<$Res>
    implements $TagsResponseCopyWith<$Res> {
  factory _$$TagsResponseImplCopyWith(
          _$TagsResponseImpl value, $Res Function(_$TagsResponseImpl) then) =
      __$$TagsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Tag> tags});
}

/// @nodoc
class __$$TagsResponseImplCopyWithImpl<$Res>
    extends _$TagsResponseCopyWithImpl<$Res, _$TagsResponseImpl>
    implements _$$TagsResponseImplCopyWith<$Res> {
  __$$TagsResponseImplCopyWithImpl(
      _$TagsResponseImpl _value, $Res Function(_$TagsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of TagsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tags = null,
  }) {
    return _then(_$TagsResponseImpl(
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TagsResponseImpl implements _TagsResponse {
  const _$TagsResponseImpl({required final List<Tag> tags}) : _tags = tags;

  factory _$TagsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TagsResponseImplFromJson(json);

  final List<Tag> _tags;
  @override
  List<Tag> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'TagsResponse(tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TagsResponseImpl &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tags));

  /// Create a copy of TagsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TagsResponseImplCopyWith<_$TagsResponseImpl> get copyWith =>
      __$$TagsResponseImplCopyWithImpl<_$TagsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TagsResponseImplToJson(
      this,
    );
  }
}

abstract class _TagsResponse implements TagsResponse {
  const factory _TagsResponse({required final List<Tag> tags}) =
      _$TagsResponseImpl;

  factory _TagsResponse.fromJson(Map<String, dynamic> json) =
      _$TagsResponseImpl.fromJson;

  @override
  List<Tag> get tags;

  /// Create a copy of TagsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TagsResponseImplCopyWith<_$TagsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
