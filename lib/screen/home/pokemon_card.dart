import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/model/pokemon.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonCard({
    Key key, this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          gradient: pokemon.generateGradient(),
          borderRadius: BorderRadius.circular(5.0),
        ),
        key: ValueKey(pokemon.name),
        child: CachedNetworkImage(
          imageUrl: pokemon.thumbnail(),
          fit: BoxFit.cover,
          placeholder: (context, url) => Padding(
              padding: EdgeInsets.all(50),
              child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(Icons.error),
                  Text('${pokemon.nationalDex} ${pokemon.name}'),
                ],
              ),
        ),
      ),
    );
  }
}