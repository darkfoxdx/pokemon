// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PokemonDetailResponse> _$pokemonDetailResponseSerializer =
    new _$PokemonDetailResponseSerializer();
Serializer<PokemonDetailQuery> _$pokemonDetailQuerySerializer =
    new _$PokemonDetailQuerySerializer();
Serializer<PokemonDetailPage> _$pokemonDetailPageSerializer =
    new _$PokemonDetailPageSerializer();
Serializer<PokemonDetailImage> _$pokemonDetailImageSerializer =
    new _$PokemonDetailImageSerializer();

class _$PokemonDetailResponseSerializer
    implements StructuredSerializer<PokemonDetailResponse> {
  @override
  final Iterable<Type> types = const [
    PokemonDetailResponse,
    _$PokemonDetailResponse
  ];
  @override
  final String wireName = 'PokemonDetailResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, PokemonDetailResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'batchcomplete',
      serializers.serialize(object.batchComplete,
          specifiedType: const FullType(String)),
      'query',
      serializers.serialize(object.query,
          specifiedType: const FullType(PokemonDetailQuery)),
    ];

    return result;
  }

  @override
  PokemonDetailResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PokemonDetailResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'batchcomplete':
          result.batchComplete = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'query':
          result.query.replace(serializers.deserialize(value,
                  specifiedType: const FullType(PokemonDetailQuery))
              as PokemonDetailQuery);
          break;
      }
    }

    return result.build();
  }
}

class _$PokemonDetailQuerySerializer
    implements StructuredSerializer<PokemonDetailQuery> {
  @override
  final Iterable<Type> types = const [PokemonDetailQuery, _$PokemonDetailQuery];
  @override
  final String wireName = 'PokemonDetailQuery';

  @override
  Iterable<Object> serialize(Serializers serializers, PokemonDetailQuery object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'pages',
      serializers.serialize(object.pages,
          specifiedType: const FullType(BuiltMap, const [
            const FullType(String),
            const FullType(PokemonDetailPage)
          ])),
    ];

    return result;
  }

  @override
  PokemonDetailQuery deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PokemonDetailQueryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'pages':
          result.pages.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(PokemonDetailPage)
              ])));
          break;
      }
    }

    return result.build();
  }
}

class _$PokemonDetailPageSerializer
    implements StructuredSerializer<PokemonDetailPage> {
  @override
  final Iterable<Type> types = const [PokemonDetailPage, _$PokemonDetailPage];
  @override
  final String wireName = 'PokemonDetailPage';

  @override
  Iterable<Object> serialize(Serializers serializers, PokemonDetailPage object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'ns',
      serializers.serialize(object.ns, specifiedType: const FullType(int)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'thumbnail',
      serializers.serialize(object.thumbnail,
          specifiedType: const FullType(PokemonDetailImage)),
      'original',
      serializers.serialize(object.original,
          specifiedType: const FullType(PokemonDetailImage)),
    ];
    if (object.pageid != null) {
      result
        ..add('pageid')
        ..add(serializers.serialize(object.pageid,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  PokemonDetailPage deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PokemonDetailPageBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'pageid':
          result.pageid = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'ns':
          result.ns = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'thumbnail':
          result.thumbnail.replace(serializers.deserialize(value,
                  specifiedType: const FullType(PokemonDetailImage))
              as PokemonDetailImage);
          break;
        case 'original':
          result.original.replace(serializers.deserialize(value,
                  specifiedType: const FullType(PokemonDetailImage))
              as PokemonDetailImage);
          break;
      }
    }

    return result.build();
  }
}

class _$PokemonDetailImageSerializer
    implements StructuredSerializer<PokemonDetailImage> {
  @override
  final Iterable<Type> types = const [PokemonDetailImage, _$PokemonDetailImage];
  @override
  final String wireName = 'PokemonDetailImage';

  @override
  Iterable<Object> serialize(Serializers serializers, PokemonDetailImage object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'source',
      serializers.serialize(object.source,
          specifiedType: const FullType(String)),
      'width',
      serializers.serialize(object.width, specifiedType: const FullType(int)),
      'height',
      serializers.serialize(object.height, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  PokemonDetailImage deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PokemonDetailImageBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'source':
          result.source = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'width':
          result.width = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'height':
          result.height = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$PokemonDetailResponse extends PokemonDetailResponse {
  @override
  final String batchComplete;
  @override
  final PokemonDetailQuery query;

  factory _$PokemonDetailResponse(
          [void Function(PokemonDetailResponseBuilder) updates]) =>
      (new PokemonDetailResponseBuilder()..update(updates)).build();

  _$PokemonDetailResponse._({this.batchComplete, this.query}) : super._() {
    if (batchComplete == null) {
      throw new BuiltValueNullFieldError(
          'PokemonDetailResponse', 'batchComplete');
    }
    if (query == null) {
      throw new BuiltValueNullFieldError('PokemonDetailResponse', 'query');
    }
  }

  @override
  PokemonDetailResponse rebuild(
          void Function(PokemonDetailResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PokemonDetailResponseBuilder toBuilder() =>
      new PokemonDetailResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PokemonDetailResponse &&
        batchComplete == other.batchComplete &&
        query == other.query;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, batchComplete.hashCode), query.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PokemonDetailResponse')
          ..add('batchComplete', batchComplete)
          ..add('query', query))
        .toString();
  }
}

class PokemonDetailResponseBuilder
    implements Builder<PokemonDetailResponse, PokemonDetailResponseBuilder> {
  _$PokemonDetailResponse _$v;

  String _batchComplete;
  String get batchComplete => _$this._batchComplete;
  set batchComplete(String batchComplete) =>
      _$this._batchComplete = batchComplete;

  PokemonDetailQueryBuilder _query;
  PokemonDetailQueryBuilder get query =>
      _$this._query ??= new PokemonDetailQueryBuilder();
  set query(PokemonDetailQueryBuilder query) => _$this._query = query;

  PokemonDetailResponseBuilder();

  PokemonDetailResponseBuilder get _$this {
    if (_$v != null) {
      _batchComplete = _$v.batchComplete;
      _query = _$v.query?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PokemonDetailResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PokemonDetailResponse;
  }

  @override
  void update(void Function(PokemonDetailResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PokemonDetailResponse build() {
    _$PokemonDetailResponse _$result;
    try {
      _$result = _$v ??
          new _$PokemonDetailResponse._(
              batchComplete: batchComplete, query: query.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'query';
        query.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PokemonDetailResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$PokemonDetailQuery extends PokemonDetailQuery {
  @override
  final BuiltMap<String, PokemonDetailPage> pages;

  factory _$PokemonDetailQuery(
          [void Function(PokemonDetailQueryBuilder) updates]) =>
      (new PokemonDetailQueryBuilder()..update(updates)).build();

  _$PokemonDetailQuery._({this.pages}) : super._() {
    if (pages == null) {
      throw new BuiltValueNullFieldError('PokemonDetailQuery', 'pages');
    }
  }

  @override
  PokemonDetailQuery rebuild(
          void Function(PokemonDetailQueryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PokemonDetailQueryBuilder toBuilder() =>
      new PokemonDetailQueryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PokemonDetailQuery && pages == other.pages;
  }

  @override
  int get hashCode {
    return $jf($jc(0, pages.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PokemonDetailQuery')
          ..add('pages', pages))
        .toString();
  }
}

class PokemonDetailQueryBuilder
    implements Builder<PokemonDetailQuery, PokemonDetailQueryBuilder> {
  _$PokemonDetailQuery _$v;

  MapBuilder<String, PokemonDetailPage> _pages;
  MapBuilder<String, PokemonDetailPage> get pages =>
      _$this._pages ??= new MapBuilder<String, PokemonDetailPage>();
  set pages(MapBuilder<String, PokemonDetailPage> pages) =>
      _$this._pages = pages;

  PokemonDetailQueryBuilder();

  PokemonDetailQueryBuilder get _$this {
    if (_$v != null) {
      _pages = _$v.pages?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PokemonDetailQuery other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PokemonDetailQuery;
  }

  @override
  void update(void Function(PokemonDetailQueryBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PokemonDetailQuery build() {
    _$PokemonDetailQuery _$result;
    try {
      _$result = _$v ?? new _$PokemonDetailQuery._(pages: pages.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'pages';
        pages.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PokemonDetailQuery', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$PokemonDetailPage extends PokemonDetailPage {
  @override
  final int pageid;
  @override
  final int ns;
  @override
  final String title;
  @override
  final PokemonDetailImage thumbnail;
  @override
  final PokemonDetailImage original;

  factory _$PokemonDetailPage(
          [void Function(PokemonDetailPageBuilder) updates]) =>
      (new PokemonDetailPageBuilder()..update(updates)).build();

  _$PokemonDetailPage._(
      {this.pageid, this.ns, this.title, this.thumbnail, this.original})
      : super._() {
    if (ns == null) {
      throw new BuiltValueNullFieldError('PokemonDetailPage', 'ns');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('PokemonDetailPage', 'title');
    }
    if (thumbnail == null) {
      throw new BuiltValueNullFieldError('PokemonDetailPage', 'thumbnail');
    }
    if (original == null) {
      throw new BuiltValueNullFieldError('PokemonDetailPage', 'original');
    }
  }

  @override
  PokemonDetailPage rebuild(void Function(PokemonDetailPageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PokemonDetailPageBuilder toBuilder() =>
      new PokemonDetailPageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PokemonDetailPage &&
        pageid == other.pageid &&
        ns == other.ns &&
        title == other.title &&
        thumbnail == other.thumbnail &&
        original == other.original;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, pageid.hashCode), ns.hashCode), title.hashCode),
            thumbnail.hashCode),
        original.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PokemonDetailPage')
          ..add('pageid', pageid)
          ..add('ns', ns)
          ..add('title', title)
          ..add('thumbnail', thumbnail)
          ..add('original', original))
        .toString();
  }
}

class PokemonDetailPageBuilder
    implements Builder<PokemonDetailPage, PokemonDetailPageBuilder> {
  _$PokemonDetailPage _$v;

  int _pageid;
  int get pageid => _$this._pageid;
  set pageid(int pageid) => _$this._pageid = pageid;

  int _ns;
  int get ns => _$this._ns;
  set ns(int ns) => _$this._ns = ns;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  PokemonDetailImageBuilder _thumbnail;
  PokemonDetailImageBuilder get thumbnail =>
      _$this._thumbnail ??= new PokemonDetailImageBuilder();
  set thumbnail(PokemonDetailImageBuilder thumbnail) =>
      _$this._thumbnail = thumbnail;

  PokemonDetailImageBuilder _original;
  PokemonDetailImageBuilder get original =>
      _$this._original ??= new PokemonDetailImageBuilder();
  set original(PokemonDetailImageBuilder original) =>
      _$this._original = original;

  PokemonDetailPageBuilder();

  PokemonDetailPageBuilder get _$this {
    if (_$v != null) {
      _pageid = _$v.pageid;
      _ns = _$v.ns;
      _title = _$v.title;
      _thumbnail = _$v.thumbnail?.toBuilder();
      _original = _$v.original?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PokemonDetailPage other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PokemonDetailPage;
  }

  @override
  void update(void Function(PokemonDetailPageBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PokemonDetailPage build() {
    _$PokemonDetailPage _$result;
    try {
      _$result = _$v ??
          new _$PokemonDetailPage._(
              pageid: pageid,
              ns: ns,
              title: title,
              thumbnail: thumbnail.build(),
              original: original.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'thumbnail';
        thumbnail.build();
        _$failedField = 'original';
        original.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PokemonDetailPage', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$PokemonDetailImage extends PokemonDetailImage {
  @override
  final String source;
  @override
  final int width;
  @override
  final int height;

  factory _$PokemonDetailImage(
          [void Function(PokemonDetailImageBuilder) updates]) =>
      (new PokemonDetailImageBuilder()..update(updates)).build();

  _$PokemonDetailImage._({this.source, this.width, this.height}) : super._() {
    if (source == null) {
      throw new BuiltValueNullFieldError('PokemonDetailImage', 'source');
    }
    if (width == null) {
      throw new BuiltValueNullFieldError('PokemonDetailImage', 'width');
    }
    if (height == null) {
      throw new BuiltValueNullFieldError('PokemonDetailImage', 'height');
    }
  }

  @override
  PokemonDetailImage rebuild(
          void Function(PokemonDetailImageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PokemonDetailImageBuilder toBuilder() =>
      new PokemonDetailImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PokemonDetailImage &&
        source == other.source &&
        width == other.width &&
        height == other.height;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, source.hashCode), width.hashCode), height.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PokemonDetailImage')
          ..add('source', source)
          ..add('width', width)
          ..add('height', height))
        .toString();
  }
}

class PokemonDetailImageBuilder
    implements Builder<PokemonDetailImage, PokemonDetailImageBuilder> {
  _$PokemonDetailImage _$v;

  String _source;
  String get source => _$this._source;
  set source(String source) => _$this._source = source;

  int _width;
  int get width => _$this._width;
  set width(int width) => _$this._width = width;

  int _height;
  int get height => _$this._height;
  set height(int height) => _$this._height = height;

  PokemonDetailImageBuilder();

  PokemonDetailImageBuilder get _$this {
    if (_$v != null) {
      _source = _$v.source;
      _width = _$v.width;
      _height = _$v.height;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PokemonDetailImage other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PokemonDetailImage;
  }

  @override
  void update(void Function(PokemonDetailImageBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PokemonDetailImage build() {
    final _$result = _$v ??
        new _$PokemonDetailImage._(
            source: source, width: width, height: height);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
