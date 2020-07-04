import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/model/pokemon.dart';
import 'package:pokemon/screen/home/pokemon_card.dart';

class PokemonGrid extends StatelessWidget {
  const PokemonGrid({
    Key key,
    @required this.filteredList,
  }) : super(key: key);

  final List<Pokemon> filteredList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Scrollbar(
          child: GridView.builder(
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemCount: filteredList.length,
            itemBuilder: (BuildContext context, int index) {
              var item = filteredList[index];
              return PokemonCard(
                key: ValueKey(item.nationalDexNumber),
                pokemon: item,
              );
            },
          ),
        ),
      ),
    );
  }
}

