import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemDataPokemonWidget extends StatelessWidget {

  String leyend;
  String data;

  ItemDataPokemonWidget({required this.leyend, required this.data,});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 4.0,
      ),
      child: Row(
        children: [
          Text(
            "$leyend: ",
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
          Text(data,),
        ],
      ),
    );
  }
}