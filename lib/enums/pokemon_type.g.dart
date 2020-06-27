// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const PokemonType _$NORMAL = const PokemonType._('NORMAL');
const PokemonType _$FIRE = const PokemonType._('FIRE');
const PokemonType _$FIGHTING = const PokemonType._('FIGHTING');
const PokemonType _$WATER = const PokemonType._('WATER');
const PokemonType _$FLYING = const PokemonType._('FLYING');
const PokemonType _$GRASS = const PokemonType._('GRASS');
const PokemonType _$POISON = const PokemonType._('POISON');
const PokemonType _$ELECTRIC = const PokemonType._('ELECTRIC');
const PokemonType _$GROUND = const PokemonType._('GROUND');
const PokemonType _$PSYCHIC = const PokemonType._('PSYCHIC');
const PokemonType _$ROCK = const PokemonType._('ROCK');
const PokemonType _$ICE = const PokemonType._('ICE');
const PokemonType _$BUG = const PokemonType._('BUG');
const PokemonType _$DRAGON = const PokemonType._('DRAGON');
const PokemonType _$GHOST = const PokemonType._('GHOST');
const PokemonType _$DARK = const PokemonType._('DARK');
const PokemonType _$STEEL = const PokemonType._('STEEL');
const PokemonType _$FAIRY = const PokemonType._('FAIRY');

PokemonType _$valueOf(String name) {
  switch (name) {
    case 'NORMAL':
      return _$NORMAL;
    case 'FIRE':
      return _$FIRE;
    case 'FIGHTING':
      return _$FIGHTING;
    case 'WATER':
      return _$WATER;
    case 'FLYING':
      return _$FLYING;
    case 'GRASS':
      return _$GRASS;
    case 'POISON':
      return _$POISON;
    case 'ELECTRIC':
      return _$ELECTRIC;
    case 'GROUND':
      return _$GROUND;
    case 'PSYCHIC':
      return _$PSYCHIC;
    case 'ROCK':
      return _$ROCK;
    case 'ICE':
      return _$ICE;
    case 'BUG':
      return _$BUG;
    case 'DRAGON':
      return _$DRAGON;
    case 'GHOST':
      return _$GHOST;
    case 'DARK':
      return _$DARK;
    case 'STEEL':
      return _$STEEL;
    case 'FAIRY':
      return _$FAIRY;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<PokemonType> _$values =
    new BuiltSet<PokemonType>(const <PokemonType>[
  _$NORMAL,
  _$FIRE,
  _$FIGHTING,
  _$WATER,
  _$FLYING,
  _$GRASS,
  _$POISON,
  _$ELECTRIC,
  _$GROUND,
  _$PSYCHIC,
  _$ROCK,
  _$ICE,
  _$BUG,
  _$DRAGON,
  _$GHOST,
  _$DARK,
  _$STEEL,
  _$FAIRY,
]);

Serializer<PokemonType> _$pokemonTypeSerializer = new _$PokemonTypeSerializer();

class _$PokemonTypeSerializer implements PrimitiveSerializer<PokemonType> {
  @override
  final Iterable<Type> types = const <Type>[PokemonType];
  @override
  final String wireName = 'PokemonType';

  @override
  Object serialize(Serializers serializers, PokemonType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  PokemonType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      PokemonType.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
