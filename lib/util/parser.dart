import 'package:pokemon/enums/region.dart';
import 'package:pokemon/model/pokemon.dart';

class Parser {

  static RegExp captureAfterLastSpace = RegExp(r'\s(?:.(?!\s))+$');

  static T getEnumFromString<T>(Iterable<T> values, String value) {
    return values.firstWhere((type) => type.toString().split(".").last.toLowerCase() == value.toLowerCase(),
        orElse: () => null);
  }

  //{{rdex|011|825|Dottler|2|Bug|Psychic}}
  static RegExp pokemonPattern = RegExp(
      r'\{\{rdex\|(\d+)\|(\d+\w?)\|([\w\W]+?)\|(\d)\|(\w+)\|?(\w*)\}\}');

  static List<Pokemon> textToPokemonList(String text, Region region) {
    var find = pokemonPattern.allMatches(text);
    var pokemons = find.map((match) => Pokemon.fromMatch(match, region)).toList();
    return pokemons;
  }

  static List<List<String>> splitPokemonStringListBy(List<String> list, int count) {

    var len = list.length;
    var size = count;
    List<List<String>> chunks = [];

    for (var i = 0; i < len; i += size) {
      var end = (i + size < len) ? i + size : len;
      chunks.add(list.sublist(i, end));
    }
    return chunks;
  }
}