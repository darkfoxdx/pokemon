import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pokemon/api/api.dart';
import 'package:pokemon/api/api_const.dart';
import 'package:pokemon/model/pokemon.dart';
import 'package:pokemon/repository/pokemon_list_repo.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<PokemonListRepo>(context).getPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<PokemonListRepo>(
          builder: (BuildContext context, PokemonListRepo repo, Widget child) {
            if (repo.pokemons.isEmpty) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Scrollbar(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                children: repo.pokemons
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            gradient: e.generateGradient(),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          key: ValueKey(e.name),
                          child: CachedNetworkImage(
                            imageUrl: e.thumbnail(),
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Padding(
                                padding: EdgeInsets.all(50),
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            );
          },
        ));
  }
}
