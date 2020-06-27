import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pokemon/api/api.dart';
import 'package:pokemon/api/api_const.dart';
import 'package:pokemon/model/pokemon.dart';
import 'package:pokemon/repository/pokemon_list_repo.dart';
import 'package:pokemon/screen/home/pokemon_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<PokemonListRepo>(context).getPokemons();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<PokemonListRepo>(
      builder: (BuildContext context, PokemonListRepo repo, Widget child) {
        if (repo.pokemons.isEmpty) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Scrollbar(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _controller,
                ),
              ),
              GridView(
                shrinkWrap: true,
                primary: false,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                children:
                    repo.pokemons.map((e) => PokemonCard(pokemon: e)).toList(),
              ),
            ],
          ),
        );
      },
    ));
  }
}
