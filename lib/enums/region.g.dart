// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const Region _$GALAR_0 = const Region._('GALAR_0');
const Region _$GALAR_1 = const Region._('GALAR_1');

Region _$valueOf(String name) {
  switch (name) {
    case 'GALAR_0':
      return _$GALAR_0;
    case 'GALAR_1':
      return _$GALAR_1;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<Region> _$values = new BuiltSet<Region>(const <Region>[
  _$GALAR_0,
  _$GALAR_1,
]);

Serializer<Region> _$regionSerializer = new _$RegionSerializer();

class _$RegionSerializer implements PrimitiveSerializer<Region> {
  @override
  final Iterable<Type> types = const <Type>[Region];
  @override
  final String wireName = 'Region';

  @override
  Object serialize(Serializers serializers, Region object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  Region deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      Region.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
