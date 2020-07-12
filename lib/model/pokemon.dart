import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/material.dart' show LinearGradient, Alignment;
import 'package:pokemon/enums/game.dart';
import 'package:pokemon/enums/pokemon_type.dart';
import 'package:pokemon/util/parser.dart';

part 'pokemon.g.dart';

@BuiltValue(defaultCompare: false)
abstract class Pokemon implements Built<Pokemon, PokemonBuilder>, Comparable {
  Pokemon._();

  factory Pokemon([void Function(PokemonBuilder) updates]) = _$Pokemon;

  static Serializer<Pokemon> get serializer => _$pokemonSerializer;

  BuiltList<Game> get games;

  String get regionalDex;

  @BuiltValueField(compare: true)
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

  String get nationalDexNumber => nationalDex.replaceAll(RegExp(r'[A-Z]'), '');

  String get formLetter => nationalDex.replaceAll(RegExp(r'[0-9]'), '');

  String get gameDex {
    String prefix;
    if (games.contains(Game.SWSH_0)) {
      prefix = Game.SWSH_0.toString();
    } else {
      prefix = Game.SWSH_1.toString();
    }
    return '$prefix\_$regionalDex';
  }
  
  @nullable
  String get append {
    var append;
    if (nationalDexNumber == '479') {
      switch (formLetter) {
        case 'O':
          append = '-Heat';
          break;
        case 'W':
          append = '-Wash';
          break;
        case 'R':
          append = '-Frost';
          break;
        case 'F':
          append = '-Fan';
          break;
        case 'L':
          append = '-Mow';
          break;
      }
    } else {
      switch (formLetter) {
        case 'A':
          append = '-Alola';
          break;
        case 'G':
          append = '-Galar';
          break;
        case 'F':
          append = '-Female';
          break;
        case 'E':
          append = '-East';
          break;
        case 'L':
          append = '-Low Key';
          break;
        case 'B':
          append = '-Blue';
          break;
        case 'GZ':
          append = '-Galar-Zen';
          break;
        case 'Z':
          append = '-Zen';
          break;
        case 'C':
          append = '';
          break;
      }
    }
    return append;
  }

  String get imageWikiName {
    return 'File:$nationalDexNumber$name$append.png';
  }

  String get wikiQuery {
    if (append != null) {
      return imageWikiName;
    } else {
      return name;
    }
  }

  String thumbnail([int size = 120]) {
    // So far only know 50, 100, 150, 160, 200, 240
    if (thumbnailUrl == null) return '';
    return thumbnailUrl.replaceAll(RegExp(r'\d+px'), '${size}px');
  }

  factory Pokemon.fromMatch(RegExpMatch match, Game region) {
    return _$Pokemon._(
      games: [region].toBuiltList(),
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

  factory Pokemon.init({String regionalDex, String nationalDex}) {
    return _$Pokemon._(
      regionalDex: regionalDex,
      nationalDex: nationalDex,
      name: '',
      noOfTypes: 0,
      type1: PokemonType.GHOST,
      type2: null,
    );
  }

  LinearGradient generateGradient() {
    return LinearGradient(
      colors: [type1.color, (type2 ?? type1).color],
      stops: [0.5, 0.5],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  @override
  int compareTo(dynamic other) {
    return regionalDex.compareTo((other as Pokemon).regionalDex);
  }
}
