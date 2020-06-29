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
  @BuiltValueField(compare: false)
  String get originalUrl;

  @nullable
  @BuiltValueField(compare: false)
  String get thumbnailUrl;

  String get nationalDexNumber => nationalDex.replaceAll(RegExp(r'[A-Z]'), '');

  String get formLetter => nationalDex.replaceAll(RegExp(r'[0-9]'), '');

  String get append {
    var append = '';
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
          append = '-Hero';
          break;
      }
    }
    return append;
  }

  String get imageWikiName {
    return 'File:$nationalDexNumber$name$append.png';
  }

  String get wikiQuery {
    if (append.isNotEmpty) {
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
