import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/material.dart' show LinearGradient, Alignment;
import 'package:pokemon/enums/pokemon_type.dart';
import 'package:pokemon/util/parser.dart';

part 'pokemon.g.dart';

abstract class Pokemon implements Built<Pokemon, PokemonBuilder>, Comparable {
  Pokemon._();

  factory Pokemon([void Function(PokemonBuilder) updates]) = _$Pokemon;

  static Serializer<Pokemon> get serializer => _$pokemonSerializer;

  String get regionalDex;

  String get nationalDex;

  String get name;

  int get noOfTypes;

  PokemonType get type1;

  @nullable
  PokemonType get type2;

  @nullable
  String get originalUrl;

  @nullable
  String get thumbnailUrl;

  String thumbnail([int size = 120]) {
    // So far only know 50, 100, 150, 160, 200, 240
    return thumbnailUrl.replaceAll(RegExp(r'\d+px'), '${size}px');
  }

  factory Pokemon.fromMatch(RegExpMatch match) {
    return _$Pokemon._(
      regionalDex: match.group(1),
      nationalDex: match.group(2),
      name: match.group(3),
      noOfTypes: int.tryParse(match.group(4)),
      type1: Parser.getEnumFromString<PokemonType>(
          PokemonType.values, match.group(5)),
      type2: Parser.getEnumFromString<PokemonType>(
          PokemonType.values, match.group(6)),
    );
  }

  LinearGradient generateGradient() {
    return LinearGradient(
      colors: [type1.color, (type2 ?? type1).color],
      stops: [0.5, 0.5],
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
    );
  }

  @override
  int compareTo(dynamic other) {
    return regionalDex.compareTo((other as Pokemon).regionalDex);
  }
}
