import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:flutter_pokedex/models/poke_api_models.dart';
import 'package:flutter_pokedex/models/pokemon_model.dart';

Future<List<PokemonModel>> getBasicPokemonData() async {
  var res = await http.get(Uri.parse(
      "https://raw.githubusercontent.com/ManishGupta0/flutter_pokedex/main/data/pokemons.json"));

  if (res.statusCode == 200) {
    Iterable i = convert.jsonDecode(res.body);
    List<PokemonModel> model =
        List<PokemonModel>.from(i.map((model) => PokemonModel.fromJson(model)));
    return model;
  } else {
    throw Exception('Failed to get Basic Pokemon Data');
  }
}

String baseUrl = "pokeapi.co";

Future<Pokemon> getPokemonInfo(int pokemonId) async {
  final url = Uri.https(baseUrl, "/api/v2/pokemon/$pokemonId");

  var res = await http.get(url);
  if (res.statusCode == 200) {
    return Pokemon.fromJson(convert.jsonDecode(res.body));
  } else {
    throw Exception("Failed to get Pokemon [$pokemonId].");
  }
}

Future<PokemonSpecies> getPokemonSpecies(int pokemonId) async {
  final url = Uri.https(baseUrl, "/api/v2/pokemon-species/$pokemonId");

  var res = await http.get(url);
  if (res.statusCode == 200) {
    return PokemonSpecies.fromJson(convert.jsonDecode(res.body));
  } else {
    throw Exception("Failed to get Pokemon Species [$pokemonId].");
  }
}

Future<EvolutionChain> getPokemonEvolutionChain(int pokemonId) async {
  final url = Uri.https(baseUrl, "/api/v2/evolution-chain/$pokemonId");

  var res = await http.get(url);
  if (res.statusCode == 200) {
    return EvolutionChain.fromJson(convert.jsonDecode(res.body));
  } else {
    throw Exception("Failed to get Pokemon Evolution [$pokemonId].");
  }
}

Future<Ability> getPokemonAbility(String abilityName) async {
  final url = Uri.https(baseUrl, "/api/v2/ability/$abilityName");

  var res = await http.get(url);
  if (res.statusCode == 200) {
    return Ability.fromJson(convert.jsonDecode(res.body));
  } else {
    throw Exception("Failed to get Pokemon Ability [$abilityName].");
  }
}

Future<Move> getPokemonMove(String url) async {
  var res = await http.get(Uri.parse(url));

  if (res.statusCode == 200) {
    return Move.fromJson(convert.jsonDecode(res.body));
  } else {
    throw Exception("Failed to get Pokemon Move [$url].");
  }
}
