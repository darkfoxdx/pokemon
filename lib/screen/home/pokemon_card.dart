import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/model/pokemon.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  final bool debug;

  const PokemonCard({
    Key key,
    this.pokemon,
    this.debug = false,
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
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: pokemon.thumbnail(),
              fit: BoxFit.cover,
              placeholder: (context, url) => Padding(
                  padding: EdgeInsets.all(50),
                  child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.error),
                  Center(child: Text('${pokemon.nationalDex} ${pokemon.name}')),
                ],
              ),
            ),
            if (debug)
              Text('${pokemon.nationalDex}\n${pokemon.regionalDex}\n${pokemon.gameDex}')
            else
              SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
