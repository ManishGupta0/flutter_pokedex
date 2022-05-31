import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/pokemon_model.dart';
import 'package:flutter_pokedex/pages/pokemon_details.dart';
import 'package:flutter_pokedex/utils/types_color.dart';
import 'package:flutter_pokedex/models/app_settings.dart';

class PokemonGridTile extends StatelessWidget {
  final PokemonModel pokemon;

  const PokemonGridTile({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: getTypeColor(pokemon.types[0]),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return PokemonDetailsPage(pokemonId: pokemon.id);
              },
            ),
          );
        },
        child: Text(pokemon.names[AppSettings.defaultLanguage]!),
      ),
    );
  }
}
