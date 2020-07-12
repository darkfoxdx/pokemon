import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/material.dart';

part 'region.g.dart';

class Region extends EnumClass {
  static Serializer<Region> get serializer => _$regionSerializer;

  static const Region GALAR_0 = _$GALAR_0;
  static const Region GALAR_1 = _$GALAR_1;

  const Region._(String name) : super(name);

  static BuiltSet<Region> get values => _$values;

  static Region valueOf(String name) => _$valueOf(name);
}