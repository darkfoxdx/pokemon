import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pokemon/enums/pokemon_type.dart';
import 'package:pokemon/enums/sort_type.dart';
import 'package:pokemon/model/pokemon.dart';

class FilterRepo extends ChangeNotifier {
  bool _isMonotype = false;
  SortType _sortType = SortType.GAME;
  List<PokemonType> _filterType = List();
  String _filterName = '';

  SortType get sortType => _sortType;

  String get filterName => _filterName;

  bool get isMonotType => _isMonotype;

  void updateSortType(SortType newValue) {
    _sortType = newValue;
    notifyListeners();
  }

  int compare(Pokemon a, Pokemon b) {
    switch (_sortType) {
      case SortType.NATIONAL:
        return a.nationalDex.compareTo(b.nationalDex);
      case SortType.TYPE_1:
        var firstSort = a.type1.toString().compareTo(b.type1.toString());
        if (firstSort != 0) return firstSort;
        if (a.type2 == null) return -1;
        if (b.type2 == null) return 1;
        return a.type2.toString().compareTo(b.type2.toString());
      case SortType.SHUFFLE:
        return [-1, 0, 1][Random().nextInt(2)];
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

  bool shouldFilterMonotype(Pokemon pokemon) {
    if (!_isMonotype) return true;
    return pokemon.type2 == null;
  }

  void updateIsMonotype(bool newValue) {
    _isMonotype = newValue;
    notifyListeners();
  }

  List<Pokemon> specialSort2(List<Pokemon> pokemons) {
    List<Pokemon> oldList =
        pokemons.where((element) => element.type2 != null).toList();

    Map<PokemonType, int> map = {};
    for (final aPokemon in oldList) {
      map[aPokemon.type1] =
          map.containsKey(aPokemon.type1) ? map[aPokemon.type1] + 1 : 1;

      map[aPokemon.type2 ?? aPokemon.type1] =
          map.containsKey(aPokemon.type2 ?? aPokemon.type1)
              ? map[aPokemon.type2 ?? aPokemon.type1] + 1
              : 1;
    }
    oldList.sort((a, b) {
      var totalA = map[a.type2 ?? a.type1];
      var totalB = map[b.type2 ?? a.type1];
      return totalA.compareTo(totalB);
    });

    var current = oldList.first;
    List<Pokemon> newList = [current];
    oldList.remove(current);

    List<Pokemon> rejects =
        pokemons.where((element) => element.type2 == null).toList();
    var tries = 0;
    while (oldList.isNotEmpty) {
      tries++;
      for (final aPokemon in oldList) {
        if ((current.type2 ?? current.type1) == aPokemon.type1) {
          tries = 0;
          current = aPokemon;
          newList.add(current);
          break;
        }
      }
      oldList.remove(current);
      if (tries > 1) {
        rejects.addAll(oldList);
        oldList.clear();
        tries = 0;
      }
    }

    var currentRejectLength = rejects.length;
    var newRejectLength = 0;
    while (newRejectLength != currentRejectLength) {
      for (final aPokemon in rejects) {
        if ((aPokemon.type2 ?? aPokemon.type1) == newList.first.type1) {
          newList.insert(0, aPokemon);
          continue;
        }
        for (int i = 1; i < newList.length; i++) {
          var previous = newList[i - 1];
          var selected = newList[i];
          if ((previous.type2 ?? previous.type1) == aPokemon.type1 &&
              (aPokemon.type2 ?? aPokemon.type1) == selected.type1) {
            newList.insert(i, aPokemon);
            break;
          }
        }
      }
      currentRejectLength = rejects.length;
      rejects.removeWhere((element) => newList.contains(element));
      newRejectLength = rejects.length;
    }

    return newList + rejects;
  }

  void bubbleSort(List<Pokemon> pokemons) {
    int n = pokemons.length;
    for (int i = 0; i < n - 1; i++) {
      for (int j = 0; j < n - i - 1; j++) {
        if ((pokemons[j].type2 ?? pokemons[j].type1) != pokemons[j + 1].type1) {
          // swap arr[j+1] and arr[i]
          Pokemon temp = pokemons[j];
          pokemons[j] = pokemons[j + 1];
          pokemons[j + 1] = temp;
        }
      }
    }
  }

  void insertSort(List<Pokemon> pokemons) {
    int n = pokemons.length;
    for (int i = 1; i < n; ++i) {
      Pokemon key = pokemons[i];
      int j = i - 1;

      /* Move elements of arr[0..i-1], that are
               greater than key, to one position ahead
               of their current position */
      while (j >= 0 && (pokemons[j].type2 ?? pokemons[j].type1) != key.type1) {
        pokemons[j + 1] = pokemons[j];
        j = j - 1;
      }
      pokemons[j + 1] = key;
    }
  }
}
