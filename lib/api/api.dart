import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon/api/api_const.dart';
import 'package:pokemon/enums/game.dart';
import 'package:pokemon/model/pokemon.dart';
import 'package:pokemon/model/serializers.dart';
import 'package:pokemon/util/parser.dart';
import 'package:pokemon/model/pokemon_detail_response.dart';

class Api {
  static String convertToQuery(Map<String, String> map) {
    return "?" +
        map.entries.map((entry) => "${entry.key}=${entry.value}").join("&");
  }

  static Future<List<Pokemon>> getGalarOri() async {
    var response = await http.get(
        ApiConst.baseUrl + convertToQuery(ApiConst.getGalarOriPokemonsQuery()));
    print(
        "getPokemonGalarOri = ${response.request.url.toString()}");
    var pokemonList = Parser.textToPokemonList(response?.body, Game.SWSH_0);
    return pokemonList;
  }

  static Future<List<Pokemon>> getGalarArmor() async {
    var response = await http.get(
        ApiConst.baseUrl + convertToQuery(ApiConst.getGalarArmorPokemonsQuery()));
    print(
        "getPokemonGalarArmor = ${response.request.url.toString()}");
    var pokemonList = Parser.textToPokemonList(response?.body, Game.SWSH_1);
    return pokemonList;
  }

  static Future<BuiltList<Pokemon>> getPokemonDetails() async {
    try {
      var client = http.Client();
      var pokemonsGalarOri = await getGalarOri();
      var pokemonsGalarArmor = await getGalarArmor();

      List<Pokemon> pokemons = [];
      pokemonsGalarOri.forEach((element) {
        var index = pokemonsGalarArmor.indexWhere((pokemonInArmor) => element == pokemonInArmor);
        var newPokemon = element;
        if (index != -1) {
          newPokemon = element.rebuild((b) => b..games.addAll(pokemonsGalarArmor[index].games));
          pokemonsGalarArmor.removeAt(index);
        }
        pokemons.add(newPokemon);
      });
      pokemons.addAll(pokemonsGalarArmor);

      var pokemonsString = pokemons.map((e) => e.wikiQuery).toList();
      var pokemonsStrings = Parser.splitPokemonStringListBy(pokemonsString, 50);

      List<PokemonDetailPage> pages = [];
      for (List<String> pokemonString in pokemonsStrings) {
        var getPokemonDetail = await client.get(ApiConst.baseUrl +
            convertToQuery(ApiConst.getPokemonDetailsQuery(pokemonString)));
        print("getPokemonDetail = ${getPokemonDetail.request.url.toString()}");
        final json = jsonDecode(getPokemonDetail.body);
        PokemonDetailResponse pokemonDetailResponse =
            serializers.deserializeWith(PokemonDetailResponse.serializer, json);
         var pageList = pokemonDetailResponse.query.pages.values;
        pages.addAll(pageList);
      }

      Set<Pokemon> mergedList = {};
      pokemons.forEach((pokemon) {
        if (pokemon.nationalDex.contains('819')) {
          print('log $pokemon');
        }
        var detail = pages.firstWhere((element) {
          var parsedName = HtmlUnescape().convert(
              element.title.replaceAll(' (Pokémon)', ''));
          return parsedName == pokemon.wikiQuery;
        }, orElse: () => null);

        var updated = pokemon;
        if (detail != null) {
          updated = pokemon.rebuild((b) => b
            ..thumbnailUrl = detail.thumbnail.source
            ..originalUrl = detail.original.source);
        }
        mergedList.add(updated);
      });

      return mergedList.toBuiltList();
    } catch (error, stack) {
      print("$error\n$stack");
    }

    return null;
  }
}
