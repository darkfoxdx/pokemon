import 'dart:collection';
import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/api/api.dart';
import 'package:pokemon/enums/pokemon_type.dart';
import 'package:pokemon/enums/sort_type.dart';
import 'package:pokemon/model/pokemon.dart';
import 'package:pokemon/model/serializers.dart';
import 'package:pokemon/util/util.dart';

class FilterRepo extends ChangeNotifier {
  SortType _sortType = SortType.REGIONAL;
  List<PokemonType> _filterType = List();
  String _filterName = '';

  String get filterName => _filterName;

  void updateFilterName(String newValue) {
    _filterName = newValue;
    notifyListeners();
  }

  bool shouldFilterType(Pokemon pokemon) {
    if (_filterType.isEmpty) return true;
    return _filterType.contains(pokemon.type1) ||
        _filterType.contains(pokemon.type2);
  }

  bool isFilterTypeSelected(PokemonType type) {
    return _filterType.contains(type);
  }

  void updateFilterType(PokemonType type) {
    if (_filterType.contains(type)) {
      _filterType.remove(type);
    } else {
      _filterType.add(type);
    }
    notifyListeners();
  }
}
