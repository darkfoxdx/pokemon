import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:pokemon/model/pokemon_detail_response.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  PokemonDetailResponse,
  PokemonDetailPage,
  BuiltMap,
  BuiltList,
  JsonObject
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin()))
    .build();
