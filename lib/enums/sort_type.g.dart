// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sort_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const SortType _$REGIONAL = const SortType._('REGIONAL');
const SortType _$NATIONAL = const SortType._('NATIONAL');
const SortType _$TYPE_1 = const SortType._('TYPE_1');

SortType _$valueOf(String name) {
  switch (name) {
    case 'REGIONAL':
      return _$REGIONAL;
    case 'NATIONAL':
      return _$NATIONAL;
    case 'TYPE_1':
      return _$TYPE_1;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<SortType> _$values = new BuiltSet<SortType>(const <SortType>[
  _$REGIONAL,
  _$NATIONAL,
  _$TYPE_1,
]);

Serializer<SortType> _$sortTypeSerializer = new _$SortTypeSerializer();

class _$SortTypeSerializer implements PrimitiveSerializer<SortType> {
  @override
  final Iterable<Type> types = const <Type>[SortType];
  @override
  final String wireName = 'SortType';

  @override
  Object serialize(Serializers serializers, SortType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  SortType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      SortType.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
