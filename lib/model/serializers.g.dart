// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(Game.serializer)
      ..add(Pokemon.serializer)
      ..add(PokemonDetailImage.serializer)
      ..add(PokemonDetailPage.serializer)
      ..add(PokemonDetailQuery.serializer)
      ..add(PokemonDetailResponse.serializer)
      ..add(PokemonType.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Game)]),
          () => new ListBuilder<Game>())
      ..addBuilderFactory(
          const FullType(BuiltMap, const [
            const FullType(String),
            const FullType(PokemonDetailPage)
          ]),
          () => new MapBuilder<String, PokemonDetailPage>()))
    .build();

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
