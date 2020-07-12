import 'package:flutter/material.dart';
import 'package:pokemon/repository/filter_repo.dart';
import 'package:pokemon/repository/pokemon_list_repo.dart';
import 'package:pokemon/screen/home/filter_drawer.dart';
import 'package:pokemon/screen/home/pokemon_grid.dart';
import 'package:pokemon/util/algorithm.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: FilterDrawer(),
      body: SafeArea(
        child: Consumer2<PokemonListRepo, FilterRepo>(
          child: Center(
            child: CircularProgressIndicator(),
          ),
          builder: (BuildContext context, PokemonListRepo repo,
              FilterRepo filter, Widget child) {
            if (repo.pokemons.isEmpty) {
              return child;
            }
            var filteredList = repo.pokemons
                .where((element) =>
                    Algorithm.contains(filter.filterName, element.name) &&
                    filter.shouldFilterType(element))
                .toList()
                  ..sort((a, b) => filter.compare(a, b));
            print("${repo.pokemons.length} - ${filteredList.length}");
            return RefreshIndicator(
              onRefresh: () => repo.refreshPokemons(),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 80,
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            onChanged: (value) {
                              filter.updateFilterName(value);
                            },
                          ),
                        ),
                        FilterButton(),
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
