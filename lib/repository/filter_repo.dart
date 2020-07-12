import 'package:flutter/material.dart';
import 'package:pokemon/enums/pokemon_type.dart';
import 'package:pokemon/enums/sort_type.dart';
import 'package:pokemon/model/pokemon.dart';

class FilterRepo extends ChangeNotifier {
  SortType _sortType = SortType.GAME;
  List<PokemonType> _filterType = List();
  String _filterName = '';

  SortType get sortType => _sortType;
  String get filterName => _filterName;

  void updateSortType(SortType newValue) {
    _sortType = newValue;
    notifyListeners();
  }

  int compare(Pokemon a, Pokemon b) {
    switch (_sortType) {
      case SortType.NATIONAL:
        return a.nationalDex.compareTo(b.nationalDex);
      case SortType.TYPE_1:
        return a.type1.toString().compareTo(b.type1.toString());
      case SortType.GAME:
      default:
        return a.gameDex.compareTo(b.gameDex);
    }
  }

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
