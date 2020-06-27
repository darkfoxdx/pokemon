import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:pokemon/enums/pokemon_type.dart';
import 'package:pokemon/model/pokemon_detail_response.dart';
import 'package:pokemon/model/pokemon.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

part 'serializers.g.dart';

final pokemonListType =
    const FullType(BuiltList, const [const FullType(Pokemon)]);

@SerializersFor(const [
  PokemonType,
  Pokemon,
  PokemonDetailResponse,
  PokemonDetailPage,
  BuiltMap,
  BuiltList,
  JsonObject,
  List,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();

T deserialize<T>(dynamic value) =>
    serializers.deserializeWith<T>(serializers.serializerForType(T), value);

BuiltList<T> deserializeListOf<T>(dynamic value) => BuiltList.from(
    value.map((value) => deserialize<T>(value)).toList(growable: false));

dynamic serialize<T>(T value) =>
    serializers.serializeWith(serializers.serializerForType(T), value);

String serializeListOf<T>(BuiltList<T> list) {
  var json = list.map((e) => serialize(e)).toList();
  var jsonString = jsonEncode(json);
  return jsonString;
}
