import 'package:built_value/built_value.dart';

part 'pokemon.g.dart';

abstract class Pokemon implements Built<Pokemon, PokemonBuilder>, Comparable {
  Pokemon._();
  factory Pokemon([void Function(PokemonBuilder) updates]) = _$Pokemon;

  String get regionalDex;
  String get nationalDex;
  String get name;
  int get noOfTypes;
  String get type1;
  @nullable
  String get type2;

  @nullable
  String get imageUrl;

  factory Pokemon.fromMatch(RegExpMatch match) {
    return _$Pokemon._(
      regionalDex: match.group(1),
      nationalDex: match.group(2),
      name: match.group(3),
      noOfTypes: int.tryParse(match.group(4)),
      type1: match.group(5),
      type2: match.group(6),
    );
  }

  @override
  int compareTo(dynamic other) {
    return regionalDex.compareTo((other as Pokemon).regionalDex);
  }

}
