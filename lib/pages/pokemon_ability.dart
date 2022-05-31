import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/poke_api_models.dart';
import 'package:flutter_pokedex/models/pokemon_model.dart';
import 'package:flutter_pokedex/pages/pokemon_details.dart';
import 'package:flutter_pokedex/utils/constants.dart';
import 'package:flutter_pokedex/utils/get_pokemon_data.dart';
import 'package:flutter_pokedex/utils/string_extensions.dart';
import 'package:flutter_pokedex/widgets/pokemon_list_tile.dart';
import 'package:provider/provider.dart';

class AbilityPage extends StatefulWidget {
  // final String ability;
  final PokemonAbility ability;
  const AbilityPage({Key? key, required this.ability}) : super(key: key);

  @override
  State<AbilityPage> createState() => _AbilityPageState();
}

class _AbilityPageState extends State<AbilityPage> {
  late Ability _ability;
  late Future<bool> _response;
  late ValueNotifier<List<PokemonModel>> _provider;

  Future<bool> fetchData() async {
    var _res =
        await Future.wait([getPokemonAbility(widget.ability.ability!.name!)]);

    _ability = _res[0];
    _provider =
        Provider.of<ValueNotifier<List<PokemonModel>>>(context, listen: false);
    return true;
  }

  @override
  void initState() {
    super.initState();
    _response = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _response,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
          );
        }
        return Container(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(15.0),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      getName(_ability.names!),
                      style: textThemeDefault.headline2,
                    ),
                    const Text("Ability"),
                  ],
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
                            abilityDescriptionBox(
                              "GAME DESCRIPTION",
                              getAbilityFlavotText(_ability.flavorTextEntries!),
                            ),
                            abilityDescriptionBox(
                              "SHORT EFFECT",
                              getVerboseShortEffectText(
                                  _ability.effectEntries!),
                            ),
                            abilityDescriptionBox(
                              "EFFECT",
                              getVerboseEffectText(_ability.effectEntries!),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "POKEMONS WITH THIS ABILITY",
                        style: textThemeDefault.headline4,
                        textAlign: TextAlign.center,
                      ),
                      ...getAbilityPokemons(_ability.pokemon).map((pokemon) {
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
      },
    );
  }

  List<PokemonModel> getAbilityPokemons(List<AbilityPokemon>? abilityPokemon) {
    if (abilityPokemon == null) {
      return [];
    }
    List<int> pokemonIds = [];
    for (var p in abilityPokemon) {
      pokemonIds.add(getIdFromUrl(p.pokemon!.url!));
    }
    return List<PokemonModel>.from(
      _provider.value.where(
        (element) => pokemonIds.contains(element.id),
      ),
    );
  }

  Container abilityDescriptionBox(String heading, String text) {
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
