// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'panels_desu_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PanelsDesuResponse _$PanelsDesuResponseFromJson(Map<String, dynamic> json) {
  return _PanelsDesuResponse.fromJson(json);
}

/// @nodoc
mixin _$PanelsDesuResponse {
  List<PanelsDesuPanel> get panels => throw _privateConstructorUsedError;
  List<PanelsDesuManga> get manga => throw _privateConstructorUsedError;

  /// Serializes this PanelsDesuResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PanelsDesuResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PanelsDesuResponseCopyWith<PanelsDesuResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PanelsDesuResponseCopyWith<$Res> {
  factory $PanelsDesuResponseCopyWith(
          PanelsDesuResponse value, $Res Function(PanelsDesuResponse) then) =
      _$PanelsDesuResponseCopyWithImpl<$Res, PanelsDesuResponse>;
  @useResult
  $Res call({List<PanelsDesuPanel> panels, List<PanelsDesuManga> manga});
}

/// @nodoc
class _$PanelsDesuResponseCopyWithImpl<$Res, $Val extends PanelsDesuResponse>
    implements $PanelsDesuResponseCopyWith<$Res> {
  _$PanelsDesuResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PanelsDesuResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? panels = null,
    Object? manga = null,
  }) {
    return _then(_value.copyWith(
      panels: null == panels
          ? _value.panels
          : panels // ignore: cast_nullable_to_non_nullable
              as List<PanelsDesuPanel>,
      manga: null == manga
          ? _value.manga
          : manga // ignore: cast_nullable_to_non_nullable
              as List<PanelsDesuManga>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PanelsDesuResponseImplCopyWith<$Res>
    implements $PanelsDesuResponseCopyWith<$Res> {
  factory _$$PanelsDesuResponseImplCopyWith(_$PanelsDesuResponseImpl value,
          $Res Function(_$PanelsDesuResponseImpl) then) =
      __$$PanelsDesuResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PanelsDesuPanel> panels, List<PanelsDesuManga> manga});
}

/// @nodoc
class __$$PanelsDesuResponseImplCopyWithImpl<$Res>
    extends _$PanelsDesuResponseCopyWithImpl<$Res, _$PanelsDesuResponseImpl>
    implements _$$PanelsDesuResponseImplCopyWith<$Res> {
  __$$PanelsDesuResponseImplCopyWithImpl(_$PanelsDesuResponseImpl _value,
      $Res Function(_$PanelsDesuResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PanelsDesuResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? panels = null,
    Object? manga = null,
  }) {
    return _then(_$PanelsDesuResponseImpl(
      panels: null == panels
          ? _value._panels
          : panels // ignore: cast_nullable_to_non_nullable
              as List<PanelsDesuPanel>,
      manga: null == manga
          ? _value._manga
          : manga // ignore: cast_nullable_to_non_nullable
              as List<PanelsDesuManga>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PanelsDesuResponseImpl extends _PanelsDesuResponse {
  const _$PanelsDesuResponseImpl(
      {required final List<PanelsDesuPanel> panels,
      required final List<PanelsDesuManga> manga})
      : _panels = panels,
        _manga = manga,
        super._();

  factory _$PanelsDesuResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PanelsDesuResponseImplFromJson(json);

  final List<PanelsDesuPanel> _panels;
  @override
  List<PanelsDesuPanel> get panels {
    if (_panels is EqualUnmodifiableListView) return _panels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_panels);
  }

  final List<PanelsDesuManga> _manga;
  @override
  List<PanelsDesuManga> get manga {
    if (_manga is EqualUnmodifiableListView) return _manga;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_manga);
  }

  @override
  String toString() {
    return 'PanelsDesuResponse(panels: $panels, manga: $manga)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PanelsDesuResponseImpl &&
            const DeepCollectionEquality().equals(other._panels, _panels) &&
            const DeepCollectionEquality().equals(other._manga, _manga));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_panels),
      const DeepCollectionEquality().hash(_manga));

  /// Create a copy of PanelsDesuResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PanelsDesuResponseImplCopyWith<_$PanelsDesuResponseImpl> get copyWith =>
      __$$PanelsDesuResponseImplCopyWithImpl<_$PanelsDesuResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PanelsDesuResponseImplToJson(
      this,
    );
  }
}

abstract class _PanelsDesuResponse extends PanelsDesuResponse {
  const factory _PanelsDesuResponse(
      {required final List<PanelsDesuPanel> panels,
      required final List<PanelsDesuManga> manga}) = _$PanelsDesuResponseImpl;
  const _PanelsDesuResponse._() : super._();

  factory _PanelsDesuResponse.fromJson(Map<String, dynamic> json) =
      _$PanelsDesuResponseImpl.fromJson;

  @override
  List<PanelsDesuPanel> get panels;
  @override
  List<PanelsDesuManga> get manga;

  /// Create a copy of PanelsDesuResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PanelsDesuResponseImplCopyWith<_$PanelsDesuResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PanelsDesuPanel _$PanelsDesuPanelFromJson(Map<String, dynamic> json) {
  return _PanelsDesuPanel.fromJson(json);
}

/// @nodoc
mixin _$PanelsDesuPanel {
  String get id => throw _privateConstructorUsedError;
  String get mangaId => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this PanelsDesuPanel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PanelsDesuPanel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PanelsDesuPanelCopyWith<PanelsDesuPanel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PanelsDesuPanelCopyWith<$Res> {
  factory $PanelsDesuPanelCopyWith(
          PanelsDesuPanel value, $Res Function(PanelsDesuPanel) then) =
      _$PanelsDesuPanelCopyWithImpl<$Res, PanelsDesuPanel>;
  @useResult
  $Res call({String id, String mangaId, String imageUrl});
}

/// @nodoc
class _$PanelsDesuPanelCopyWithImpl<$Res, $Val extends PanelsDesuPanel>
    implements $PanelsDesuPanelCopyWith<$Res> {
  _$PanelsDesuPanelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PanelsDesuPanel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mangaId = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      mangaId: null == mangaId
          ? _value.mangaId
          : mangaId // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PanelsDesuPanelImplCopyWith<$Res>
    implements $PanelsDesuPanelCopyWith<$Res> {
  factory _$$PanelsDesuPanelImplCopyWith(_$PanelsDesuPanelImpl value,
          $Res Function(_$PanelsDesuPanelImpl) then) =
      __$$PanelsDesuPanelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String mangaId, String imageUrl});
}

/// @nodoc
class __$$PanelsDesuPanelImplCopyWithImpl<$Res>
    extends _$PanelsDesuPanelCopyWithImpl<$Res, _$PanelsDesuPanelImpl>
    implements _$$PanelsDesuPanelImplCopyWith<$Res> {
  __$$PanelsDesuPanelImplCopyWithImpl(
      _$PanelsDesuPanelImpl _value, $Res Function(_$PanelsDesuPanelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PanelsDesuPanel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mangaId = null,
    Object? imageUrl = null,
  }) {
    return _then(_$PanelsDesuPanelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      mangaId: null == mangaId
          ? _value.mangaId
          : mangaId // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PanelsDesuPanelImpl implements _PanelsDesuPanel {
  const _$PanelsDesuPanelImpl(
      {required this.id, required this.mangaId, required this.imageUrl});

  factory _$PanelsDesuPanelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PanelsDesuPanelImplFromJson(json);

  @override
  final String id;
  @override
  final String mangaId;
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'PanelsDesuPanel(id: $id, mangaId: $mangaId, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PanelsDesuPanelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mangaId, mangaId) || other.mangaId == mangaId) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, mangaId, imageUrl);

  /// Create a copy of PanelsDesuPanel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PanelsDesuPanelImplCopyWith<_$PanelsDesuPanelImpl> get copyWith =>
      __$$PanelsDesuPanelImplCopyWithImpl<_$PanelsDesuPanelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PanelsDesuPanelImplToJson(
      this,
    );
  }
}

abstract class _PanelsDesuPanel implements PanelsDesuPanel {
  const factory _PanelsDesuPanel(
      {required final String id,
      required final String mangaId,
      required final String imageUrl}) = _$PanelsDesuPanelImpl;

  factory _PanelsDesuPanel.fromJson(Map<String, dynamic> json) =
      _$PanelsDesuPanelImpl.fromJson;

  @override
  String get id;
  @override
  String get mangaId;
  @override
  String get imageUrl;

  /// Create a copy of PanelsDesuPanel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PanelsDesuPanelImplCopyWith<_$PanelsDesuPanelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PanelsDesuManga _$PanelsDesuMangaFromJson(Map<String, dynamic> json) {
  return _PanelsDesuManga.fromJson(json);
}

/// @nodoc
mixin _$PanelsDesuManga {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  /// Serializes this PanelsDesuManga to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PanelsDesuManga
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PanelsDesuMangaCopyWith<PanelsDesuManga> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PanelsDesuMangaCopyWith<$Res> {
  factory $PanelsDesuMangaCopyWith(
          PanelsDesuManga value, $Res Function(PanelsDesuManga) then) =
      _$PanelsDesuMangaCopyWithImpl<$Res, PanelsDesuManga>;
  @useResult
  $Res call({String id, String title});
}

/// @nodoc
class _$PanelsDesuMangaCopyWithImpl<$Res, $Val extends PanelsDesuManga>
    implements $PanelsDesuMangaCopyWith<$Res> {
  _$PanelsDesuMangaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PanelsDesuManga
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PanelsDesuMangaImplCopyWith<$Res>
    implements $PanelsDesuMangaCopyWith<$Res> {
  factory _$$PanelsDesuMangaImplCopyWith(_$PanelsDesuMangaImpl value,
          $Res Function(_$PanelsDesuMangaImpl) then) =
      __$$PanelsDesuMangaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title});
}

/// @nodoc
class __$$PanelsDesuMangaImplCopyWithImpl<$Res>
    extends _$PanelsDesuMangaCopyWithImpl<$Res, _$PanelsDesuMangaImpl>
    implements _$$PanelsDesuMangaImplCopyWith<$Res> {
  __$$PanelsDesuMangaImplCopyWithImpl(
      _$PanelsDesuMangaImpl _value, $Res Function(_$PanelsDesuMangaImpl) _then)
      : super(_value, _then);

  /// Create a copy of PanelsDesuManga
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_$PanelsDesuMangaImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PanelsDesuMangaImpl extends _PanelsDesuManga {
  const _$PanelsDesuMangaImpl({required this.id, required this.title})
      : super._();

  factory _$PanelsDesuMangaImpl.fromJson(Map<String, dynamic> json) =>
      _$$PanelsDesuMangaImplFromJson(json);

  @override
  final String id;
  @override
  final String title;

  @override
  String toString() {
    return 'PanelsDesuManga(id: $id, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PanelsDesuMangaImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  /// Create a copy of PanelsDesuManga
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PanelsDesuMangaImplCopyWith<_$PanelsDesuMangaImpl> get copyWith =>
      __$$PanelsDesuMangaImplCopyWithImpl<_$PanelsDesuMangaImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PanelsDesuMangaImplToJson(
      this,
    );
  }
}

abstract class _PanelsDesuManga extends PanelsDesuManga {
  const factory _PanelsDesuManga(
      {required final String id,
      required final String title}) = _$PanelsDesuMangaImpl;
  const _PanelsDesuManga._() : super._();

  factory _PanelsDesuManga.fromJson(Map<String, dynamic> json) =
      _$PanelsDesuMangaImpl.fromJson;

  @override
  String get id;
  @override
  String get title;

  /// Create a copy of PanelsDesuManga
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PanelsDesuMangaImplCopyWith<_$PanelsDesuMangaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
