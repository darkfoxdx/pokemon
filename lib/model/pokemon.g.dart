// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Pokemon> _$pokemonSerializer = new _$PokemonSerializer();

class _$PokemonSerializer implements StructuredSerializer<Pokemon> {
  @override
  final Iterable<Type> types = const [Pokemon, _$Pokemon];
  @override
  final String wireName = 'Pokemon';

  @override
  Iterable<Object> serialize(Serializers serializers, Pokemon object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'regionalDex',
      serializers.serialize(object.regionalDex,
          specifiedType: const FullType(String)),
      'nationalDex',
      serializers.serialize(object.nationalDex,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'noOfTypes',
      serializers.serialize(object.noOfTypes,
          specifiedType: const FullType(int)),
      'type1',
      serializers.serialize(object.type1,
          specifiedType: const FullType(PokemonType)),
    ];
    if (object.type2 != null) {
      result
        ..add('type2')
        ..add(serializers.serialize(object.type2,
            specifiedType: const FullType(PokemonType)));
    }
    if (object.originalUrl != null) {
      result
        ..add('originalUrl')
        ..add(serializers.serialize(object.originalUrl,
            specifiedType: const FullType(String)));
    }
    if (object.thumbnailUrl != null) {
      result
        ..add('thumbnailUrl')
        ..add(serializers.serialize(object.thumbnailUrl,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Pokemon deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PokemonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'regionalDex':
          result.regionalDex = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'nationalDex':
          result.nationalDex = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'noOfTypes':
          result.noOfTypes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'type1':
          result.type1 = serializers.deserialize(value,
              specifiedType: const FullType(PokemonType)) as PokemonType;
          break;
        case 'type2':
          result.type2 = serializers.deserialize(value,
              specifiedType: const FullType(PokemonType)) as PokemonType;
          break;
        case 'originalUrl':
          result.originalUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'thumbnailUrl':
          result.thumbnailUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Pokemon extends Pokemon {
  @override
  final String regionalDex;
  @override
  final String nationalDex;
  @override
  final String name;
  @override
  final int noOfTypes;
  @override
  final PokemonType type1;
  @override
  final PokemonType type2;
  @override
  final String originalUrl;
  @override
  final String thumbnailUrl;

  factory _$Pokemon([void Function(PokemonBuilder) updates]) =>
      (new PokemonBuilder()..update(updates)).build();

  _$Pokemon._(
      {this.regionalDex,
      this.nationalDex,
      this.name,
      this.noOfTypes,
      this.type1,
      this.type2,
      this.originalUrl,
      this.thumbnailUrl})
      : super._() {
    if (regionalDex == null) {
      throw new BuiltValueNullFieldError('Pokemon', 'regionalDex');
    }
    if (nationalDex == null) {
      throw new BuiltValueNullFieldError('Pokemon', 'nationalDex');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('Pokemon', 'name');
    }
    if (noOfTypes == null) {
      throw new BuiltValueNullFieldError('Pokemon', 'noOfTypes');
    }
    if (type1 == null) {
      throw new BuiltValueNullFieldError('Pokemon', 'type1');
    }
  }

  @override
  Pokemon rebuild(void Function(PokemonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PokemonBuilder toBuilder() => new PokemonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Pokemon && nationalDex == other.nationalDex;
  }

  @override
  int get hashCode {
    return $jf($jc(0, nationalDex.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Pokemon')
          ..add('regionalDex', regionalDex)
          ..add('nationalDex', nationalDex)
          ..add('name', name)
          ..add('noOfTypes', noOfTypes)
          ..add('type1', type1)
          ..add('type2', type2)
          ..add('originalUrl', originalUrl)
          ..add('thumbnailUrl', thumbnailUrl))
        .toString();
  }
}

class PokemonBuilder implements Builder<Pokemon, PokemonBuilder> {
  _$Pokemon _$v;

  String _regionalDex;
  String get regionalDex => _$this._regionalDex;
  set regionalDex(String regionalDex) => _$this._regionalDex = regionalDex;

  String _nationalDex;
  String get nationalDex => _$this._nationalDex;
  set nationalDex(String nationalDex) => _$this._nationalDex = nationalDex;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  int _noOfTypes;
  int get noOfTypes => _$this._noOfTypes;
  set noOfTypes(int noOfTypes) => _$this._noOfTypes = noOfTypes;

  PokemonType _type1;
  PokemonType get type1 => _$this._type1;
  set type1(PokemonType type1) => _$this._type1 = type1;

  PokemonType _type2;
  PokemonType get type2 => _$this._type2;
  set type2(PokemonType type2) => _$this._type2 = type2;

  String _originalUrl;
  String get originalUrl => _$this._originalUrl;
  set originalUrl(String originalUrl) => _$this._originalUrl = originalUrl;

  String _thumbnailUrl;
  String get thumbnailUrl => _$this._thumbnailUrl;
  set thumbnailUrl(String thumbnailUrl) => _$this._thumbnailUrl = thumbnailUrl;

  PokemonBuilder();

  PokemonBuilder get _$this {
    if (_$v != null) {
      _regionalDex = _$v.regionalDex;
      _nationalDex = _$v.nationalDex;
      _name = _$v.name;
      _noOfTypes = _$v.noOfTypes;
      _type1 = _$v.type1;
      _type2 = _$v.type2;
      _originalUrl = _$v.originalUrl;
      _thumbnailUrl = _$v.thumbnailUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Pokemon other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Pokemon;
  }

  @override
  void update(void Function(PokemonBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Pokemon build() {
    final _$result = _$v ??
        new _$Pokemon._(
            regionalDex: regionalDex,
            nationalDex: nationalDex,
            name: name,
            noOfTypes: noOfTypes,
            type1: type1,
            type2: type2,
            originalUrl: originalUrl,
            thumbnailUrl: thumbnailUrl);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
