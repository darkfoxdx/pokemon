import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/material.dart';

part 'pokemon_type.g.dart';

class PokemonType extends EnumClass {
  static Serializer<PokemonType> get serializer => _$pokemonTypeSerializer;

  static const PokemonType NORMAL = _$NORMAL;
  static const PokemonType FIRE = _$FIRE;
  static const PokemonType FIGHTING = _$FIGHTING;
  static const PokemonType WATER = _$WATER;
  static const PokemonType FLYING = _$FLYING;
  static const PokemonType GRASS = _$GRASS;
  static const PokemonType POISON = _$POISON;
  static const PokemonType ELECTRIC = _$ELECTRIC;
  static const PokemonType GROUND = _$GROUND;
  static const PokemonType PSYCHIC = _$PSYCHIC;
  static const PokemonType ROCK = _$ROCK;
  static const PokemonType ICE = _$ICE;
  static const PokemonType BUG = _$BUG;
  static const PokemonType DRAGON = _$DRAGON;
  static const PokemonType GHOST = _$GHOST;
  static const PokemonType DARK = _$DARK;
  static const PokemonType STEEL = _$STEEL;
  static const PokemonType FAIRY = _$FAIRY;

  const PokemonType._(String name) : super(name);

  static BuiltSet<PokemonType> get values => _$values;

  static PokemonType valueOf(String name) => _$valueOf(name);
}

extension PokemonTypeExtension on PokemonType {
  Color get color {
    switch (this) {
      case PokemonType.NORMAL:
        return Color(0xFFA8A878);
      case PokemonType.FIRE:
        return Color(0xFFF08030);
      case PokemonType.FIGHTING:
        return Color(0xFFC03028);
      case PokemonType.WATER:
        return Color(0xFF6890F0);
      case PokemonType.FLYING:
        return Color(0xFFA890F0);
      case PokemonType.GRASS:
        return Color(0xFF78C850);
      case PokemonType.POISON:
        return Color(0xFFA040A0);
      case PokemonType.ELECTRIC:
        return Color(0xFFF8D030);
      case PokemonType.GROUND:
        return Color(0xFFE0C068);
      case PokemonType.PSYCHIC:
        return Color(0xFFF85888);
      case PokemonType.ROCK:
        return Color(0xFFB8A038);
      case PokemonType.ICE:
        return Color(0xFF98D8D8);
      case PokemonType.BUG:
        return Color(0xFFA8B820);
      case PokemonType.DRAGON:
        return Color(0xFF7038F8);
      case PokemonType.GHOST:
        return Color(0xFF705898);
      case PokemonType.DARK:
        return Color(0xFF705848);
      case PokemonType.STEEL:
        return Color(0xFFB8B8D0);
      case PokemonType.FAIRY:
        return Color(0xFFEE99AC);
      default:
        return null;
    }
  }
}
