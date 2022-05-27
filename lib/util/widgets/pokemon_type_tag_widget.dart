import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PokemonTypeTagWidget extends StatelessWidget {
  String pokemonType;
  PokemonTypeTagWidget({required this.pokemonType,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: 5.0, horizontal: 10.0),
      margin: EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Text(
        pokemonType,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}