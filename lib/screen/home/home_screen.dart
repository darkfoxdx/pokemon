import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pokemon/api/api.dart';
import 'package:pokemon/api/api_const.dart';
import 'package:pokemon/model/pokemon.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pokemon"),
        ),
        body: FutureBuilder(
          initialData: null,
          future: Api.getPokemonDetails(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Pokemon>> snapshot) {
            if (snapshot == null || snapshot.data == null) {
              return Center(child: CircularProgressIndicator(),);
            }
            return Scrollbar(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                children: snapshot.data
                    .map(
                      (e) => CachedNetworkImage(
                        imageUrl: e.imageUrl,
                        placeholder: (context, url) => Padding(
                            padding: EdgeInsets.all(50),
                            child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    )
                    .toList(),
              ),
            );
          },
        ));
  }
}
