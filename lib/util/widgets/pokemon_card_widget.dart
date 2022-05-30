import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo5_pokedex/model/pokemon_model.dart';
import 'package:flutter_codigo5_pokedex/pages/pokemon_detail_page.dart';
import 'package:flutter_codigo5_pokedex/util/widgets/pokemon_type_tag_widget.dart';

import '../../ui/general/colors.dart';
//import '../const/pokemon_type_color.dart';

class PokemonCardWidget extends StatelessWidget {
  Pokemon pokemon;

  PokemonCardWidget({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>PokemonDetailPage(pokemon: pokemon,)));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: colorPokemon[pokemon.type[0]],//obtenerColor(pokemon.type[0]),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: -24,
              right: -14,
              child: Image.asset(
                'assets/images/pokeball.png',
                height: 120,
                color: Colors.white.withOpacity(0.3),
              ),
            ),
            Positioned(
              bottom: -5,
              right: -8,
              child: Image.network(
                pokemon.img, //"http://www.serebii.net/pokemongo/pokemon/001.png",
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 5.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    pokemon.name, //"Bulbasaur",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: pokemon.type.map<Widget>((e) {
                      return PokemonTypeTagWidget(
                        pokemonType: e,
                      );
                    }).toList(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
