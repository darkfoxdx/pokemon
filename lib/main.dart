import 'package:flutter/material.dart';
import 'package:pokemon/repository/pokemon_list_repo.dart';
import 'package:pokemon/screen/home/home_screen.dart';
import 'package:pokemon/util/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PokemonListRepo>(
      create: (context) => PokemonListRepo(),
      child: MaterialApp(
        title: 'Pokemon',
        theme: ThemeUtil.customize(ThemeData.light()),
        home: HomeScreen(),
      ),
    );
  }
}
