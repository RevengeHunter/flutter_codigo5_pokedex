import 'package:flutter/material.dart';
import 'package:flutter_codigo5_pokedex/ui/general/colors.dart';
import 'package:flutter_codigo5_pokedex/util/widgets/pokemon_type_tag_widget.dart';

import '../model/pokemon_model.dart';
import '../util/widgets/item_data_pokemon_widget.dart';

class PokemonDetailPage extends StatelessWidget {
  Pokemon pokemon;
  PokemonDetailPage({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPokemon[pokemon.type[0]],
      appBar: AppBar(
        backgroundColor: colorPokemon[pokemon.type[0]],
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            right: -30.0,
            top: MediaQuery.of(context).size.height * 0.10,
            child: Image.asset(
              'assets/images/pokeball.png',
              scale: 5,
              color: Colors.white.withOpacity(0.3),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 28.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      pokemon.name,
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: pokemon.type
                          .map<Widget>(
                              (e) => (PokemonTypeTagWidget(pokemonType: e)))
                          .toList(),
                    ),
                  ],
                ),
                Text(
                  "#${pokemon.num}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Expanded(
                flex: 4,
                child: SizedBox(),
              ),
              Expanded(
                flex: 9,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Text(
                              "About Pokemon",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            ItemDataPokemonWidget(
                              leyend: "Height",
                              data: pokemon.height,
                            ),
                            ItemDataPokemonWidget(
                              leyend: "Weight",
                              data: pokemon.weight,
                            ),
                            ItemDataPokemonWidget(
                              leyend: "Candy Count",
                              data: pokemon.candyCount.toString(),
                            ),
                            ItemDataPokemonWidget(
                              leyend: "Egg",
                              data: pokemon.egg.toString(),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                vertical: 4.0,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "Multipliers: ",
                                  ),
                                  Row(
                                    children: (pokemon.multipliers ?? [])
                                        .map<Widget>((e) => ItemDataPokemonTags(
                                              tags: e.toString(),
                                            ))
                                        .toList(),
                                  ),
                                  //Chip se usa para filtros y listados
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                vertical: 4.0,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(vertical: 15.0,),
                                    child: Text(
                                      "Weaknesses: ",
                                    ),
                                  ),
                                  // Expanded(
                                  //   child: SingleChildScrollView(
                                  //     scrollDirection: Axis.horizontal,
                                  //     physics: BouncingScrollPhysics(),
                                  //     child: Row(
                                  //       verticalDirection: VerticalDirection.down,
                                  //       children: (pokemon.weaknesses ?? [])
                                  //           .map<Widget>((e) =>
                                  //           ItemDataPokemonTags(
                                  //             tags: e,
                                  //           ))
                                  //           .toList(),
                                  //     ),
                                  //   ),
                                  // ),
                                  Expanded(
                                    child: Wrap(
                                      spacing: 0.0, // gap between adjacent chips
                                      alignment: WrapAlignment.start,
                                      runSpacing: 0.0,
                                      children: (pokemon.weaknesses ?? [])
                                          .map<Widget>((e) => ItemDataPokemonTags(
                                                tags: e,
                                              ))
                                          .toList(),
                                    ),
                                  ),
                                  //Chip se usa para filtros y listados
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                vertical: 4.0,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(vertical: 15.0,),
                                    child: Text(
                                      "Pre - Evolution: ",
                                    ),
                                  ),
                                  // Expanded(
                                  //   child: SingleChildScrollView(
                                  //     scrollDirection: Axis.horizontal,
                                  //     physics: BouncingScrollPhysics(),
                                  //     child: Row(
                                  //       verticalDirection: VerticalDirection.down,
                                  //       children: (pokemon.weaknesses ?? [])
                                  //           .map<Widget>((e) =>
                                  //           ItemDataPokemonTags(
                                  //             tags: e,
                                  //           ))
                                  //           .toList(),
                                  //     ),
                                  //   ),
                                  // ),
                                  Expanded(
                                    child: Wrap(
                                      spacing: 0.0, // gap between adjacent chips
                                      alignment: WrapAlignment.start,
                                      runSpacing: 0.0,
                                      children: (pokemon.prevEvolution ?? [])
                                          .map<Widget>((e) => ItemDataPokemonTags(
                                        tags: e.name ?? "",
                                      ))
                                          .toList(),
                                    ),
                                  ),
                                  //Chip se usa para filtros y listados
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                vertical: 4.0,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(vertical: 15.0,),
                                    child: Text(
                                      "Netx - Evolution: ",
                                    ),
                                  ),
                                  // Expanded(
                                  //   child: SingleChildScrollView(
                                  //     scrollDirection: Axis.horizontal,
                                  //     physics: BouncingScrollPhysics(),
                                  //     child: Row(
                                  //       verticalDirection: VerticalDirection.down,
                                  //       children: (pokemon.weaknesses ?? [])
                                  //           .map<Widget>((e) =>
                                  //           ItemDataPokemonTags(
                                  //             tags: e,
                                  //           ))
                                  //           .toList(),
                                  //     ),
                                  //   ),
                                  // ),
                                  Expanded(
                                    child: Wrap(
                                      spacing: 0.0, // gap between adjacent chips
                                      alignment: WrapAlignment.start,
                                      runSpacing: 0.0,
                                      children: (pokemon.nextEvolution ?? [])
                                          .map<Widget>((e) => ItemDataPokemonTags(
                                        tags: e.name ?? "",
                                      ))
                                          .toList(),
                                    ),
                                  ),
                                  //Chip se usa para filtros y listados
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned.fill(
                        top: MediaQuery.of(context).size.height * (-0.115),
                        //right: MediaQuery.of(context).size.width * 0.2,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Image.network(
                            pokemon.img,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ItemDataPokemonTags extends StatelessWidget {
  String tags;
  ItemDataPokemonTags({required this.tags});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 2.0,
      ),
      child: Chip(
        label: Text(
          tags,
        ),
        elevation: 2,
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        backgroundColor: Colors.white38,
      ),
    );
  }
}
