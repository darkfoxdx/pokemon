import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';

part 'pokemon_detail_response.g.dart';

abstract class PokemonDetailResponse
    implements Built<PokemonDetailResponse, PokemonDetailResponseBuilder> {
  PokemonDetailResponse._();

  factory PokemonDetailResponse(
          [void Function(PokemonDetailResponseBuilder) updates]) =
      _$PokemonDetailResponse;

  static Serializer<PokemonDetailResponse> get serializer =>
      _$pokemonDetailResponseSerializer;

  @BuiltValueField(wireName: 'batchcomplete')
  String get batchComplete;

  PokemonDetailQuery get query;
}

abstract class PokemonDetailQuery
    implements Built<PokemonDetailQuery, PokemonDetailQueryBuilder> {
  PokemonDetailQuery._();

  factory PokemonDetailQuery(
          [void Function(PokemonDetailQueryBuilder) updates]) =
      _$PokemonDetailQuery;

  static Serializer<PokemonDetailQuery> get serializer =>
      _$pokemonDetailQuerySerializer;

  BuiltMap<String, PokemonDetailPage> get pages;
}

abstract class PokemonDetailPage
    implements Built<PokemonDetailPage, PokemonDetailPageBuilder> {
  PokemonDetailPage._();

  factory PokemonDetailPage([void Function(PokemonDetailPageBuilder) updates]) =
      _$PokemonDetailPage;

  static Serializer<PokemonDetailPage> get serializer =>
      _$pokemonDetailPageSerializer;

  int get pageid;

  int get ns;

  String get title;

  PokemonDetailImage get thumbnail;

  PokemonDetailImage get original;
}

abstract class PokemonDetailImage
    implements Built<PokemonDetailImage, PokemonDetailImageBuilder> {
  PokemonDetailImage._();

  factory PokemonDetailImage(
          [void Function(PokemonDetailImageBuilder) updates]) =
      _$PokemonDetailImage;

  static Serializer<PokemonDetailImage> get serializer =>
      _$pokemonDetailImageSerializer;

  String get source;

  int get width;

  int get height;
}
