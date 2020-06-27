import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon/api/api_const.dart';
import 'package:pokemon/model/pokemon.dart';
import 'package:pokemon/model/serializers.dart';
import 'package:pokemon/util/parser.dart';
import 'package:pokemon/model/pokemon_detail_response.dart';

class Api {
  static String convertToQuery(Map<String, String> map) {
    return "?" +
        map.entries.map((entry) => "${entry.key}=${entry.value}").join("&");
  }

  static Future<http.Response> getPokemon() async => http.get(
      ApiConst.baseUrl + convertToQuery(ApiConst.getGalarOriPokemonsQuery()));

  static Future<BuiltList<Pokemon>> getPokemonDetails() async {
    try {
      var client = http.Client();
      var getPokemon = await client.get(ApiConst.baseUrl +
          convertToQuery(ApiConst.getGalarOriPokemonsQuery()));
      print("getPokemon = ${getPokemon.request.url.toString()}");
      var result = getPokemon?.body;

      var pokemons = Parser.textToPokemonList(result);
      var pokemonsString = pokemons.map((e) => e.name).toList();
      var pokemonsStrings = Parser.splitPokemonStringListBy(pokemonsString, 50);

      List<PokemonDetailPage> pages = [];
      for (List<String> pokemonString in pokemonsStrings) {
        var getPokemonDetail = await client.get(ApiConst.baseUrl +
            convertToQuery(ApiConst.getPokemonDetailsQuery(pokemonString)));
        print("getPokemonDetail = ${getPokemonDetail.request.url.toString()}");
        final json = jsonDecode(getPokemonDetail.body);
        PokemonDetailResponse pokemonDetailResponse =
            serializers.deserializeWith(PokemonDetailResponse.serializer, json);
        pages.addAll(pokemonDetailResponse.query.pages.values);
      }

      Set<Pokemon> mergedList = {};
      pokemons.forEach((pokemon) {
        var detail = pages.firstWhere(
            (element) =>
                element.title.contains(pokemon.name) &&
                !pokemon.nationalDex.contains(RegExp(r'[A-Z]')),
            orElse: () => null);

        var updated = pokemon;
        if (detail != null) {
          updated = pokemon.rebuild((b) => b
            ..thumbnailUrl = detail.thumbnail.source
            ..originalUrl = detail.original.source);
        }
        mergedList.add(updated);
      });

      return BuiltList.of(mergedList);
    } catch (error, stack) {
      print("$error\n$stack");
    }

    return null;
  }
}
