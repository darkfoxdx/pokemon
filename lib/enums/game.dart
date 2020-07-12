import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/material.dart';

part 'game.g.dart';

class Game extends EnumClass {
  static Serializer<Game> get serializer => _$gameSerializer;

  static const Game SWSH_0 = _$SWSH_0;
  static const Game SWSH_1 = _$SWSH_1;

  const Game._(String name) : super(name);

  static BuiltSet<Game> get values => _$values;

  static Game valueOf(String name) => _$valueOf(name);
}