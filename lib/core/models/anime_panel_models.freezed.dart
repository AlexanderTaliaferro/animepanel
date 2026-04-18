// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_panel_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AnimePanelImage _$AnimePanelImageFromJson(Map<String, dynamic> json) {
  return _AnimePanelImage.fromJson(json);
}

/// @nodoc
mixin _$AnimePanelImage {
  String get id => throw _privateConstructorUsedError;
  String get thumbnailUrl => throw _privateConstructorUsedError;
  String get cdnUrl => throw _privateConstructorUsedError;
  String get sourceTitle => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;

  /// Serializes this AnimePanelImage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnimePanelImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnimePanelImageCopyWith<AnimePanelImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimePanelImageCopyWith<$Res> {
  factory $AnimePanelImageCopyWith(
          AnimePanelImage value, $Res Function(AnimePanelImage) then) =
      _$AnimePanelImageCopyWithImpl<$Res, AnimePanelImage>;
  @useResult
  $Res call(
      {String id,
      String thumbnailUrl,
      String cdnUrl,
      String sourceTitle,
      List<String> tags});
}

/// @nodoc
class _$AnimePanelImageCopyWithImpl<$Res, $Val extends AnimePanelImage>
    implements $AnimePanelImageCopyWith<$Res> {
  _$AnimePanelImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnimePanelImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? thumbnailUrl = null,
    Object? cdnUrl = null,
    Object? sourceTitle = null,
    Object? tags = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: null == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
      cdnUrl: null == cdnUrl
          ? _value.cdnUrl
          : cdnUrl // ignore: cast_nullable_to_non_nullable
              as String,
      sourceTitle: null == sourceTitle
          ? _value.sourceTitle
          : sourceTitle // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnimePanelImageImplCopyWith<$Res>
    implements $AnimePanelImageCopyWith<$Res> {
  factory _$$AnimePanelImageImplCopyWith(_$AnimePanelImageImpl value,
          $Res Function(_$AnimePanelImageImpl) then) =
      __$$AnimePanelImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String thumbnailUrl,
      String cdnUrl,
      String sourceTitle,
      List<String> tags});
}

/// @nodoc
class __$$AnimePanelImageImplCopyWithImpl<$Res>
    extends _$AnimePanelImageCopyWithImpl<$Res, _$AnimePanelImageImpl>
    implements _$$AnimePanelImageImplCopyWith<$Res> {
  __$$AnimePanelImageImplCopyWithImpl(
      _$AnimePanelImageImpl _value, $Res Function(_$AnimePanelImageImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnimePanelImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? thumbnailUrl = null,
    Object? cdnUrl = null,
    Object? sourceTitle = null,
    Object? tags = null,
  }) {
    return _then(_$AnimePanelImageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: null == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
      cdnUrl: null == cdnUrl
          ? _value.cdnUrl
          : cdnUrl // ignore: cast_nullable_to_non_nullable
              as String,
      sourceTitle: null == sourceTitle
          ? _value.sourceTitle
          : sourceTitle // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnimePanelImageImpl implements _AnimePanelImage {
  const _$AnimePanelImageImpl(
      {required this.id,
      required this.thumbnailUrl,
      required this.cdnUrl,
      required this.sourceTitle,
      final List<String> tags = const []})
      : _tags = tags;

  factory _$AnimePanelImageImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnimePanelImageImplFromJson(json);

  @override
  final String id;
  @override
  final String thumbnailUrl;
  @override
  final String cdnUrl;
  @override
  final String sourceTitle;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'AnimePanelImage(id: $id, thumbnailUrl: $thumbnailUrl, cdnUrl: $cdnUrl, sourceTitle: $sourceTitle, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimePanelImageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.cdnUrl, cdnUrl) || other.cdnUrl == cdnUrl) &&
            (identical(other.sourceTitle, sourceTitle) ||
                other.sourceTitle == sourceTitle) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, thumbnailUrl, cdnUrl,
      sourceTitle, const DeepCollectionEquality().hash(_tags));

  /// Create a copy of AnimePanelImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimePanelImageImplCopyWith<_$AnimePanelImageImpl> get copyWith =>
      __$$AnimePanelImageImplCopyWithImpl<_$AnimePanelImageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnimePanelImageImplToJson(
      this,
    );
  }
}

abstract class _AnimePanelImage implements AnimePanelImage {
  const factory _AnimePanelImage(
      {required final String id,
      required final String thumbnailUrl,
      required final String cdnUrl,
      required final String sourceTitle,
      final List<String> tags}) = _$AnimePanelImageImpl;

  factory _AnimePanelImage.fromJson(Map<String, dynamic> json) =
      _$AnimePanelImageImpl.fromJson;

  @override
  String get id;
  @override
  String get thumbnailUrl;
  @override
  String get cdnUrl;
  @override
  String get sourceTitle;
  @override
  List<String> get tags;

  /// Create a copy of AnimePanelImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnimePanelImageImplCopyWith<_$AnimePanelImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnimePanelSearchResponse _$AnimePanelSearchResponseFromJson(
    Map<String, dynamic> json) {
  return _AnimePanelSearchResponse.fromJson(json);
}

/// @nodoc
mixin _$AnimePanelSearchResponse {
  String? get query => throw _privateConstructorUsedError;
  bool? get trending => throw _privateConstructorUsedError;
  List<AnimePanelImage> get data => throw _privateConstructorUsedError;

  /// Serializes this AnimePanelSearchResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnimePanelSearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnimePanelSearchResponseCopyWith<AnimePanelSearchResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimePanelSearchResponseCopyWith<$Res> {
  factory $AnimePanelSearchResponseCopyWith(AnimePanelSearchResponse value,
          $Res Function(AnimePanelSearchResponse) then) =
      _$AnimePanelSearchResponseCopyWithImpl<$Res, AnimePanelSearchResponse>;
  @useResult
  $Res call({String? query, bool? trending, List<AnimePanelImage> data});
}

/// @nodoc
class _$AnimePanelSearchResponseCopyWithImpl<$Res,
        $Val extends AnimePanelSearchResponse>
    implements $AnimePanelSearchResponseCopyWith<$Res> {
  _$AnimePanelSearchResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnimePanelSearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = freezed,
    Object? trending = freezed,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      trending: freezed == trending
          ? _value.trending
          : trending // ignore: cast_nullable_to_non_nullable
              as bool?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<AnimePanelImage>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnimePanelSearchResponseImplCopyWith<$Res>
    implements $AnimePanelSearchResponseCopyWith<$Res> {
  factory _$$AnimePanelSearchResponseImplCopyWith(
          _$AnimePanelSearchResponseImpl value,
          $Res Function(_$AnimePanelSearchResponseImpl) then) =
      __$$AnimePanelSearchResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? query, bool? trending, List<AnimePanelImage> data});
}

/// @nodoc
class __$$AnimePanelSearchResponseImplCopyWithImpl<$Res>
    extends _$AnimePanelSearchResponseCopyWithImpl<$Res,
        _$AnimePanelSearchResponseImpl>
    implements _$$AnimePanelSearchResponseImplCopyWith<$Res> {
  __$$AnimePanelSearchResponseImplCopyWithImpl(
      _$AnimePanelSearchResponseImpl _value,
      $Res Function(_$AnimePanelSearchResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnimePanelSearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = freezed,
    Object? trending = freezed,
    Object? data = null,
  }) {
    return _then(_$AnimePanelSearchResponseImpl(
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      trending: freezed == trending
          ? _value.trending
          : trending // ignore: cast_nullable_to_non_nullable
              as bool?,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<AnimePanelImage>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnimePanelSearchResponseImpl implements _AnimePanelSearchResponse {
  const _$AnimePanelSearchResponseImpl(
      {this.query, this.trending, required final List<AnimePanelImage> data})
      : _data = data;

  factory _$AnimePanelSearchResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnimePanelSearchResponseImplFromJson(json);

  @override
  final String? query;
  @override
  final bool? trending;
  final List<AnimePanelImage> _data;
  @override
  List<AnimePanelImage> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'AnimePanelSearchResponse(query: $query, trending: $trending, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimePanelSearchResponseImpl &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.trending, trending) ||
                other.trending == trending) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, query, trending, const DeepCollectionEquality().hash(_data));

  /// Create a copy of AnimePanelSearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimePanelSearchResponseImplCopyWith<_$AnimePanelSearchResponseImpl>
      get copyWith => __$$AnimePanelSearchResponseImplCopyWithImpl<
          _$AnimePanelSearchResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnimePanelSearchResponseImplToJson(
      this,
    );
  }
}

abstract class _AnimePanelSearchResponse implements AnimePanelSearchResponse {
  const factory _AnimePanelSearchResponse(
          {final String? query,
          final bool? trending,
          required final List<AnimePanelImage> data}) =
      _$AnimePanelSearchResponseImpl;

  factory _AnimePanelSearchResponse.fromJson(Map<String, dynamic> json) =
      _$AnimePanelSearchResponseImpl.fromJson;

  @override
  String? get query;
  @override
  bool? get trending;
  @override
  List<AnimePanelImage> get data;

  /// Create a copy of AnimePanelSearchResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnimePanelSearchResponseImplCopyWith<_$AnimePanelSearchResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
