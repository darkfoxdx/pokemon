import 'dart:collection';
import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/api/api.dart';
import 'package:pokemon/enums/pokemon_type.dart';
import 'package:pokemon/model/pokemon.dart';
import 'package:pokemon/model/serializers.dart';
import 'package:pokemon/util/util.dart';

class FilterRepo extends ChangeNotifier {
  List<PokemonType> _filterType = List();
  String _filterName = '';

  String get filterName => _filterName;

  void updateFilterName(String newValue) {
    _filterName = newValue;
    notifyListeners();
  }
}
