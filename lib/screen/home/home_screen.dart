import 'package:flutter/material.dart';
import 'package:pokemon/enums/pokemon_type.dart';
import 'package:pokemon/repository/filter_repo.dart';
import 'package:pokemon/repository/pokemon_list_repo.dart';
import 'package:pokemon/screen/home/pokemon_grid.dart';
import 'package:pokemon/util/algorithm.dart';
import 'package:pokemon/util/theme.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<PokemonListRepo>(context).getPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: FilterDrawer(),
      body: SafeArea(
        child: Consumer2<PokemonListRepo, FilterRepo>(
          builder: (BuildContext context, PokemonListRepo repo,
              FilterRepo filter, Widget child) {
            if (repo.pokemons.isEmpty) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            var filteredList = repo.pokemons
                .where((element) =>
                    Algorithm.contains(filter.filterName, element.name))
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

class FilterDrawer extends StatelessWidget {
  const FilterDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.all(8.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 5,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
          ),
          itemCount: PokemonType.values.length,
          itemBuilder: (BuildContext context, int index) {
            var item = PokemonType.values.elementAt(index);
            return Container(
              decoration: BoxDecoration(
                color: item.color,
              ),
              alignment: Alignment.center,
              child: Text(
                item.name,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(0, 3),
                      blurRadius: 3,
                    )
                  ],
                ),
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
                side:
                    BorderSide(color: Theme.of(context).unselectedWidgetColor)),
            child: Icon(Icons.filter_list),
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
          ),
        ));
  }
}
