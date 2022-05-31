import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/poke_api_models.dart';
import 'package:flutter_pokedex/models/pokemon_model.dart';
import 'package:flutter_pokedex/pages/pokemon_details.dart';
import 'package:flutter_pokedex/utils/constants.dart';
import 'package:flutter_pokedex/utils/string_extensions.dart';
import 'package:flutter_pokedex/widgets/pokemon_list_tile.dart';
import 'package:provider/provider.dart';

class MovePage extends StatefulWidget {
  final Move move;
  const MovePage({Key? key, required this.move}) : super(key: key);

  @override
  State<MovePage> createState() => _MovePageState();
}

class _MovePageState extends State<MovePage> {
  late ValueNotifier<List<PokemonModel>> _provider;

  Future<bool> fetchData() async {
    setState(() {});
    _provider =
        Provider.of<ValueNotifier<List<PokemonModel>>>(context, listen: false);
    return true;
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15.0),
            alignment: Alignment.center,
            child: Text(
              getName(widget.move.names!),
              style: textThemeDefault.headline2,
            ),
          ),
          Expanded(
            child: Container(
              color: const Color(0xFFEDF8F4),
              child: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        descriptionBox(
                          "GAME DESCRIPTION",
                          getMoveFlavotText(widget.move.flavorTextEntries!),
                        ),
                        descriptionBox(
                          "SHORT EFFECT",
                          getVerboseShortEffectText(widget.move.effectEntries!),
                        ),
                        descriptionBox(
                          "EFFECT",
                          getVerboseEffectText(widget.move.effectEntries!),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "POKEMONS THAT LEARNS THIS MOVE",
                    style: textThemeDefault.headline4,
                    textAlign: TextAlign.center,
                  ),
                  ...getAbilityPokemons(widget.move.learnedByPokemon)
                      .map((pokemon) {
                    return SizedBox(
                      height: 118,
                      child: PokemonListTile(
                        pokemon: pokemon,
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return PokemonDetailsPage(
                                    pokemonId: pokemon.id);
                              },
                            ),
                          );
                        },
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<PokemonModel> getAbilityPokemons(List<NamedAPIResource>? movePokemon) {
    if (movePokemon == null) {
      return [];
    }
    List<int> pokemonIds = [];
    for (var p in movePokemon) {
      pokemonIds.add(getIdFromUrl(p.url!));
    }
    return List<PokemonModel>.from(
      _provider.value.where(
        (element) => pokemonIds.contains(element.id),
      ),
    );
  }

  Container descriptionBox(String heading, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: const Color(0xFFE1EAE7),
      ),
      child: Column(
        children: [
          Text(
            heading,
            textAlign: TextAlign.center,
            style: textThemeSmall.headline4,
          ),
          const SizedBox(height: 20),
          Text(
            text,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
