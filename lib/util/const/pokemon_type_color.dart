import 'dart:ui';

Color obtenerColor(String pokemonType){
  Color t =  Color(0xffFFFFFF);
  switch (pokemonType) {
    case "Bug":
      t = Color(0xff58785D);
      break;
    case "Dark":
      t = Color(0xff040608);
      break;
    case "Dragon":
      t = Color(0xffED953A);
      break;
    case "Electric":
      t = Color(0xffCFC53E);
      break;
    case "Fairy":
      t = Color(0xffE499BA);
      break;
    case "Fighting":
      t = Color(0xff551315);
      break;
    case "Fire":
      t = Color(0xffE2202F);
      break;
    case "Flying":
      t = Color(0xffA3A9CB);
      break;
    case "Ghost":
      t = Color(0xff322821);
      break;
    case "Grass":
      t = Color(0xff47AB51);
      break;
    case "Ground":
      t = Color(0xff96632D);
      break;
    case "Ice":
      t = Color(0xff72C5E6);
      break;
    case "Normal":
      t = Color(0xffFBCFD0);
      break;
    case "Poison":
      t = Color(0xff5B3081);
      break;
    case "Psychic":
      t = Color(0xffDB1E80);
      break;
    case "Rock":
      t = Color(0xff382718);
      break;
    case "Steel":
      t = Color(0xff24353B);
      break;
    case "Water":
      t = Color(0xff2382B7);
      break;
    default:
      t = Color(0xff6EE2E3);
  }

  return t;
}