// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

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
  final String type1;
  @override
  final String type2;
  @override
  final String imageUrl;

  factory _$Pokemon([void Function(PokemonBuilder) updates]) =>
      (new PokemonBuilder()..update(updates)).build();

  _$Pokemon._(
      {this.regionalDex,
      this.nationalDex,
      this.name,
      this.noOfTypes,
      this.type1,
      this.type2,
      this.imageUrl})
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
    return other is Pokemon &&
        regionalDex == other.regionalDex &&
        nationalDex == other.nationalDex &&
        name == other.name &&
        noOfTypes == other.noOfTypes &&
        type1 == other.type1 &&
        type2 == other.type2 &&
        imageUrl == other.imageUrl;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, regionalDex.hashCode), nationalDex.hashCode),
                        name.hashCode),
                    noOfTypes.hashCode),
                type1.hashCode),
            type2.hashCode),
        imageUrl.hashCode));
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
          ..add('imageUrl', imageUrl))
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

  String _type1;
  String get type1 => _$this._type1;
  set type1(String type1) => _$this._type1 = type1;

  String _type2;
  String get type2 => _$this._type2;
  set type2(String type2) => _$this._type2 = type2;

  String _imageUrl;
  String get imageUrl => _$this._imageUrl;
  set imageUrl(String imageUrl) => _$this._imageUrl = imageUrl;

  PokemonBuilder();

  PokemonBuilder get _$this {
    if (_$v != null) {
      _regionalDex = _$v.regionalDex;
      _nationalDex = _$v.nationalDex;
      _name = _$v.name;
      _noOfTypes = _$v.noOfTypes;
      _type1 = _$v.type1;
      _type2 = _$v.type2;
      _imageUrl = _$v.imageUrl;
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
            imageUrl: imageUrl);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
