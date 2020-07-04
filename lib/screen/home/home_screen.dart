import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pokemon/api/api.dart';
import 'package:pokemon/api/api_const.dart';
import 'package:pokemon/model/pokemon.dart';
import 'package:pokemon/repository/pokemon_list_repo.dart';
import 'package:pokemon/screen/home/pokemon_card.dart';
import 'package:pokemon/util/algorithm.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _stringFilter;

  @override
  void initState() {
    super.initState();
    _stringFilter = '';
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<PokemonListRepo>(context).getPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<PokemonListRepo>(
          builder: (BuildContext context, PokemonListRepo repo, Widget child) {
            if (repo.pokemons.isEmpty) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            var filteredList = repo.pokemons.where((element) {
              if (_stringFilter == '') {
                return true;
              } else {
                return Algorithm.contains(_stringFilter, element.name);
              }
            }).toList();
            print("${repo.pokemons.length} - ${filteredList.length}");
            return RefreshIndicator(
              onRefresh: () => repo.refreshPokemons(),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          _stringFilter = value;
                        });
                      },
                    ),
                  ),
                  Expanded(
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
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
