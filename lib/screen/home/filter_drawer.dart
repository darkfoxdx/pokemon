import 'package:flutter/material.dart';
import 'package:pokemon/enums/pokemon_type.dart';
import 'package:pokemon/repository/filter_repo.dart';
import 'package:pokemon/util/theme.dart';
import 'package:provider/provider.dart';

class FilterDrawer extends StatelessWidget {
  const FilterDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Consumer<FilterRepo>(
          builder: (BuildContext context, FilterRepo filter, Widget child) {
            return GridView.builder(
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
                var offsetY = filter.isFilterTypeSelected(item) ? 0.0 : 4.0;
                var borderWidth = filter.isFilterTypeSelected(item) ? 3.0 : 0.0;
                return InkWell(
                  onTap: () {
                    filter.updateFilterType(item);
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      color: item.color,
                      border: Border.all(width: borderWidth),
                    ),
                    child: Container(
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
                              offset: Offset(0, offsetY),
                              blurRadius: 3,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
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
