import 'dart:collection';
import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/api/api.dart';
import 'package:pokemon/model/pokemon.dart';
import 'package:pokemon/model/serializers.dart';
import 'package:pokemon/util/util.dart';

class PokemonListRepo extends ChangeNotifier {
  BuiltList<Pokemon> _pokemon = BuiltList();
  var _isInit = true;

  UnmodifiableListView<Pokemon> get pokemons => UnmodifiableListView(_pokemon);

  final specifiedType = const FullType(BuiltList, [const FullType(Pokemon)]);

  void saveToFile(BuiltList<Pokemon> list) async {
    var json = serializeListOf<Pokemon>(list);
    await Util.writeToFile('pokemon', json);
  }

  Future<BuiltList<Pokemon>> readFromFile() async {
    var list;
    try {
      var jsonString = await Util.readFromFile('pokemon');
      if (jsonString == null) return null;
      var json = jsonDecode(jsonString);
      list = deserializeListOf<Pokemon>(json);
    } on FormatException catch (_) {
      return null;
    }
    return list;
  }

  void getPokemons() async {
    if (_isInit) {
      var list = await readFromFile();
      if (list == null || list.isEmpty) {
        list = await Api.getPokemonDetails();
        saveToFile(list);
      }
      _pokemon = list;
      _isInit = false;
      notifyListeners();
    }
  }
}
