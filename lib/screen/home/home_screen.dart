import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pokemon/api/api.dart';
import 'package:pokemon/api/api_const.dart';
import 'package:pokemon/model/pokemon.dart';
import 'package:pokemon/repository/pokemon_list_repo.dart';
import 'package:pokemon/screen/home/pokemon_card.dart';
import 'package:pokemon/screen/home/pokemon_grid.dart';
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

            var filteredList = repo.pokemons
                .where((element) =>
                    Algorithm.contains(_stringFilter, element.name))
                .toList();
            print("${repo.pokemons.length} - ${filteredList.length}");
            return RefreshIndicator(
              onRefresh: () => repo.refreshPokemons(),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                _stringFilter = value;
                              });
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 8.0),
                          padding: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              border: Border.fromBorderSide(BorderSide(
                                  color:
                                      Theme.of(context).unselectedWidgetColor)),
                            ),
                            child: IconButton(
                              icon: Icon(Icons.filter_list),
                              onPressed: () {},
                            )),
                      ],
                    ),
                  ),
                  PokemonGrid(filteredList: filteredList),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
