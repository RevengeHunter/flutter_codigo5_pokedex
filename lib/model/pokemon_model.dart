class Pokemon {
  Pokemon({
    required this.id,
     required this.num,
     required this.name,
     required this.img,
     required this.type,
     required this.height,
     required this.weight,
     required this.candy,
     this.candyCount,
     this.egg,
     required this.spawnChance,
     required this.avgSpawns,
     required this.spawnTime,
  });

  int id;
  String num;
  String name;
  String img;
  List<String> type;
  String height;
  String weight;
  String candy;
  double? candyCount;
  String? egg;
  double spawnChance;
  double avgSpawns;
  String spawnTime;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
    id: json["id"],
    num: json["num"],
    name: json["name"],
    img: json["img"],
    type: List<String>.from(json["type"].map((x) => x)),
    height: json["height"],
    weight: json["weight"],
    candy: json["candy"],
    candyCount: (json["candy_count"] != null) ? double.parse(json["candy_count"].toString()) : null,
    egg: json["egg"],
    spawnChance: json["spawn_chance"].toDouble(),
    avgSpawns: double.parse(json["avg_spawns"].toString()),
    spawnTime: json["spawn_time"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "num": num,
    "name": name,
    "img": img,
    "type": List<dynamic>.from(type.map((x) => x)),
    "height": height,
    "weight": weight,
    "candy": candy,
    "candy_count": candyCount,
    "egg": egg,
    "spawn_chance": spawnChance,
    "avg_spawns": avgSpawns,
    "spawn_time": spawnTime,
  };
}