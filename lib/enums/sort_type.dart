import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/material.dart';

part 'sort_type.g.dart';

class SortType extends EnumClass {
  static Serializer<SortType> get serializer => _$sortTypeSerializer;

  static const SortType GAME = _$GAME;
  static const SortType NATIONAL = _$NATIONAL;
  static const SortType TYPE_1 = _$TYPE_1;
  static const SortType SPECIAL = _$SPECIAL;
  static const SortType SHUFFLE = _$SHUFFLE;

  const SortType._(String name) : super(name);

  static BuiltSet<SortType> get values => _$values;

  static SortType valueOf(String name) => _$valueOf(name);
}

