import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:pokemon/api/api.dart';
import 'package:pokemon/model/pokemon.dart';

class PokemonListRepo extends ChangeNotifier {
  final List<Pokemon> _pokemon = [];
  var _isInit = true;

  UnmodifiableListView<Pokemon> get pokemons => UnmodifiableListView(_pokemon);

  void getPokemons() async {
    if (_isInit) {
      var list = await Api.getPokemonDetails();
      _pokemon.addAll(list);
      notifyListeners();
      _isInit = false;
    }
  }
}