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
import 'package:pokemon/util/theme.dart';
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
                  Container(
                    height: 80,
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
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

class FilterButton extends StatelessWidget {
  const FilterButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 8.0, bottom: 2.5, top: 2.5),
        child: AspectRatio(
          aspectRatio: 1.0,
          child: FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(ThemeUtil.borderRadius)),
                side: BorderSide(
                    color: Theme.of(context)
                        .unselectedWidgetColor)),
            child: Icon(Icons.filter_list),
            onPressed: () {},
          ),
        ));
  }
}
