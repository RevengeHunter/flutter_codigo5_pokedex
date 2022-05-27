import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo5_pokedex/model/pokemon_model.dart';
import 'package:http/http.dart' as http;

import '../util/widgets/pokemon_card_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pokemonList = [];

  List<Pokemon> _pokemon = [];

  @override
  void initState() {
    super.initState();
    getDataPokemon();
  }

  getDataPokemon() async {
    Uri url = Uri.parse(
        "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    http.Response response = await http.get(url);
    // print(response.statusCode);
    // print(response.body);//Siempre lo manda como string, se tiene que convertir en Json
    Map<String, dynamic> myMap = jsonDecode(response.body);
    pokemonList = myMap["pokemon"];

    pokemonList.forEach((pokemon) {
      _pokemon.add(Pokemon.fromJson(pokemon));
    });

    //print(myMap["pokemon"]);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(
            12,
          ),
          child: Column(
            children: [
              Text(
                "Pokedex",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GridView.count(
                physics: const ScrollPhysics(),
                shrinkWrap: true, //Para que se ajuste al SingleScrollView
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.3,
                children: _pokemon.map<Widget>((e) {
                  print(e);
                  return PokemonCardWidget(
                    pokemon: e,
                  );
                }).toList(), //[
                //   PokemonCardWidget(pokemon: ),
                //   Container(
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(15.0),
                //       color: Color(0xff4ACFB0),
                //     ),
                //   ),
                // ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
