class PokemonModel {
  late int id;
  late Map<String, String> names;
  late List<String> types;

  PokemonModel({required this.id, required this.names, required this.types});

  PokemonModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    names = Map<String, String>.from(json['names']);
    types = json['types'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['names'] = names;
    data['types'] = types;
    return data;
  }
}
