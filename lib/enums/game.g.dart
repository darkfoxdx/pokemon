// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const Game _$SWSH_0 = const Game._('SWSH_0');
const Game _$SWSH_1 = const Game._('SWSH_1');

Game _$valueOf(String name) {
  switch (name) {
    case 'SWSH_0':
      return _$SWSH_0;
    case 'SWSH_1':
      return _$SWSH_1;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<Game> _$values = new BuiltSet<Game>(const <Game>[
  _$SWSH_0,
  _$SWSH_1,
]);

Serializer<Game> _$gameSerializer = new _$GameSerializer();

class _$GameSerializer implements PrimitiveSerializer<Game> {
  @override
  final Iterable<Type> types = const <Type>[Game];
  @override
  final String wireName = 'Game';

  @override
  Object serialize(Serializers serializers, Game object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  Game deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      Game.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
