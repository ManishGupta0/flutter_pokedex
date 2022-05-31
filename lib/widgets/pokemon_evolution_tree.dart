import 'dart:math';
import 'package:collection/collection.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/app_settings.dart';
import 'package:flutter_pokedex/models/poke_api_models.dart';
import 'package:flutter_pokedex/models/pokemon_model.dart';
import 'package:flutter_pokedex/pages/pokemon_details.dart';
import 'package:flutter_pokedex/utils/get_pokemon_data.dart';
import 'package:flutter_pokedex/utils/string_extensions.dart';
import 'package:flutter_pokedex/utils/types_color.dart';
import 'package:flutter_pokedex/utils/utils.dart';
import 'package:flutter_pokedex/widgets/type_chip.dart';
import 'package:provider/provider.dart';

class PokemonEvolutionTree extends StatefulWidget {
  final PokemonSpecies species;

  const PokemonEvolutionTree({Key? key, required this.species})
      : super(key: key);

  @override
  State<PokemonEvolutionTree> createState() => _PokemonEvolutionTreeState();
}

class _PokemonEvolutionTreeState extends State<PokemonEvolutionTree> {
  late Future<bool> _future;
  final double verticalSpacing = 50.0;

  late EvolutionChain _evolutionChain;
  List<int> _pokemonsIdsInChain = [];
  List<PokemonModel> _pokemonsInChain = [];
  late List<int> _evolutionPattern;

  late ValueNotifier<List<PokemonModel>> _provider;

  Future<bool> fetchData() async {
    _evolutionChain = await getPokemonEvolutionChain(
        getIdFromUrl(widget.species.evolutionChain!.url!));
    whatever();
    return true;
  }

  void whatever() {
    _pokemonsIdsInChain = [];
    _evolutionPattern = [1];
    chainMaxDepth(_evolutionChain.chain!);
    _pokemonsInChain = getPokemonsInChain();
  }

  int chainMaxDepth(ChainLink chain, {int depth = 1}) {
    int d = 0;
    if (!_pokemonsIdsInChain.contains(getIdFromUrl(chain.species!.url!))) {
      _pokemonsIdsInChain.add(getIdFromUrl(chain.species!.url!));
    }
    // _evolutionPattern[depth] = chain.evolvesTo!.length;
    if (chain.evolvesTo!.isNotEmpty) {
      _evolutionPattern.add(chain.evolvesTo!.length);
    }
    for (var c in chain.evolvesTo!) {
      d = max(d, chainMaxDepth(c, depth: depth + 1));
    }

    return d + 1;
  }

  List<PokemonModel> getPokemonsInChain() {
    List<PokemonModel> temp = [];
    for (var id in _pokemonsIdsInChain) {
      temp.add(
        _provider.value.firstWhere((element) => element.id == id),
      );
    }
    return temp;
  }

  @override
  void initState() {
    super.initState();
    _provider =
        Provider.of<ValueNotifier<List<PokemonModel>>>(context, listen: false);

    _future = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _future,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
          );
        }
        return InteractiveViewer(
          child: Container(
            child: getEvolutionLayout(),
          ),
        );
      },
    );
  }

  Widget getEvolutionLayout() {
    Function eq = const ListEquality().equals;

    if (eq(_evolutionPattern, [1, 1, 1])) {
      return tree_1Line();
    } else if (eq(_evolutionPattern, [1, 2])) {
      return tree_1_2();
    } else if (eq(_evolutionPattern, [1, 1, 2])) {
      return tree_1_1_2();
    } else if (eq(_evolutionPattern, [1, 8])) {
      return tree_1_8();
    } else if (eq(_evolutionPattern, [1, 3])) {
      return tree_1_3();
    } else if (eq(_evolutionPattern, [1, 4])) {
      return tree_1_4();
    } else if (eq(_evolutionPattern, [1, 2, 1, 1])) {
      return tree_1_2_1_1();
    } else if (eq(_evolutionPattern, [1, 2, 1])) {
      return tree_1_2_1();
    }
    return tree_1Line();
  }

  Widget tree_1Line() {
    List<Widget> w = [];
    for (var p in _pokemonsInChain) {
      w.add(evolutionCard(p));
      if (_pokemonsInChain.last.hashCode != p.hashCode) {
        w.add(arrow(text: "Level Up"));
      }
    }
    return Wrap(
      spacing: 10.0,
      runSpacing: verticalSpacing,
      alignment: WrapAlignment.spaceAround,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: w,
    );
  }

  Widget tree_1_2() {
    return Wrap(
      spacing: 10.0,
      runSpacing: verticalSpacing,
      alignment: WrapAlignment.spaceEvenly,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        evolutionCard(_pokemonsInChain[0]),
        Column(
          children: [
            arrow(text: "text", angle: -pi / 4),
            verticalSpace(height: verticalSpacing + 50),
            arrow(text: "text", angle: pi / 4),
          ],
        ),
        Column(
          children: [
            evolutionCard(_pokemonsInChain[1]),
            verticalSpace(height: verticalSpacing),
            evolutionCard(_pokemonsInChain[2]),
          ],
        ),
      ],
    );
  }

  Widget tree_1_1_2() {
    return Wrap(
      spacing: 10.0,
      runSpacing: verticalSpacing,
      alignment: WrapAlignment.spaceAround,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        evolutionCard(_pokemonsInChain[0]),
        arrow(text: "Level Up"),
        evolutionCard(_pokemonsInChain[1]),
        Column(
          children: [
            arrow(text: "Level Up", angle: -pi / 4),
            verticalSpace(height: verticalSpacing + 50),
            arrow(text: "Level Up", angle: pi / 4),
          ],
        ),
        Column(
          children: [
            evolutionCard(_pokemonsInChain[2]),
            verticalSpace(height: verticalSpacing),
            evolutionCard(_pokemonsInChain[3]),
          ],
        ),
      ],
    );
  }

  Widget tree_1_8() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            evolutionCard(_pokemonsInChain[1]),
            evolutionCard(_pokemonsInChain[2]),
            evolutionCard(_pokemonsInChain[3]),
          ],
        ),
        verticalSpace(height: verticalSpacing),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            arrow(text: "Level Up", angle: -pi / 1.3),
            arrow(text: "Level Up", angle: -pi / 2),
            arrow(text: "Level Up", angle: pi + pi / 1.3),
          ],
        ),
        verticalSpace(height: verticalSpacing),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            evolutionCard(_pokemonsInChain[4]),
            arrow(text: "Level Up", angle: pi),
            evolutionCard(_pokemonsInChain[0]),
            arrow(text: "Level Up", angle: 0.0),
            evolutionCard(_pokemonsInChain[5]),
          ],
        ),
        verticalSpace(height: verticalSpacing),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            arrow(text: "Level Up", angle: pi / 1.3),
            arrow(text: "Level Up", angle: pi / 2),
            arrow(text: "Level Up", angle: pi - pi / 1.3),
          ],
        ),
        verticalSpace(height: verticalSpacing),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            evolutionCard(_pokemonsInChain[6]),
            evolutionCard(_pokemonsInChain[7]),
            evolutionCard(_pokemonsInChain[8]),
          ],
        ),
      ],
    );
  }

  Widget tree_1_3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        evolutionCard(_pokemonsInChain[0]),
        verticalSpace(height: verticalSpacing / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            arrow(text: "Level Up", angle: pi / 1.3),
            arrow(text: "Level Up", angle: pi / 2),
            arrow(text: "Level Up", angle: pi - pi / 1.3),
          ],
        ),
        verticalSpace(height: verticalSpacing / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            evolutionCard(_pokemonsInChain[1]),
            evolutionCard(_pokemonsInChain[2]),
            evolutionCard(_pokemonsInChain[3]),
          ],
        ),
      ],
    );
  }

  Widget tree_1_4() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        evolutionCard(_pokemonsInChain[0]),
        verticalSpace(height: verticalSpacing / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            arrow(text: "Level Up", angle: pi - pi / 4),
            arrow(text: "Level Up", angle: pi / 1.7),
            arrow(text: "Level Up", angle: pi - pi / 1.7),
            arrow(text: "Level Up", angle: pi / 4),
          ],
        ),
        verticalSpace(height: verticalSpacing / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            evolutionCard(_pokemonsInChain[1]),
            evolutionCard(_pokemonsInChain[2]),
            evolutionCard(_pokemonsInChain[3]),
            evolutionCard(_pokemonsInChain[4]),
          ],
        ),
      ],
    );
  }

  Widget tree_1_2_1_1() {
    return Wrap(
      spacing: 10.0,
      runSpacing: verticalSpacing,
      alignment: WrapAlignment.spaceAround,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        evolutionCard(_pokemonsInChain[0]),
        Column(
          children: [
            arrow(text: "text", angle: -pi / 4),
            verticalSpace(height: verticalSpacing + 50),
            arrow(text: "text", angle: pi / 4),
          ],
        ),
        Column(
          children: [
            evolutionCard(_pokemonsInChain[1]),
            verticalSpace(height: verticalSpacing),
            evolutionCard(_pokemonsInChain[3]),
          ],
        ),
        Column(
          children: [
            arrow(text: "text"),
            verticalSpace(height: verticalSpacing + 170),
            arrow(text: "text"),
          ],
        ),
        Column(
          children: [
            evolutionCard(_pokemonsInChain[2]),
            verticalSpace(height: verticalSpacing),
            evolutionCard(_pokemonsInChain[4]),
          ],
        ),
      ],
    );
  }

  Widget tree_1_2_1() {
    return Wrap(
      spacing: 10.0,
      runSpacing: verticalSpacing,
      alignment: WrapAlignment.spaceAround,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        evolutionCard(_pokemonsInChain[0]),
        Column(
          children: [
            arrow(text: "text", angle: -pi / 4),
            verticalSpace(height: verticalSpacing + 50),
            arrow(text: "text", angle: pi / 4),
          ],
        ),
        Column(
          children: [
            evolutionCard(_pokemonsInChain[1]),
            verticalSpace(height: verticalSpacing),
            evolutionCard(_pokemonsInChain[2]),
          ],
        ),
        Column(
          children: [
            verticalSpace(height: verticalSpacing + 100),
            arrow(text: "text", angle: -pi / 4),
          ],
        ),
        Column(
          children: [
            evolutionCard(_pokemonsInChain[3]),
          ],
        ),
      ],
    );
  }

  Widget arrow(
      {double angle = 0.0,
      String text = "",
      VerticalDirection? direction = VerticalDirection.up}) {
    return Transform.rotate(
      angle: angle,
      alignment: Alignment.center,
      child: Column(
        children: [
          Transform.scale(
            scaleX: 5.0,
            child: const Icon(Icons.arrow_right_alt),
          ),
        ],
      ),
    );
  }

  Widget evolutionCard(PokemonModel pokemon) {
    return Container(
      width: 75,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: pokemon.types.length > 1 ? [0.3, 0.67, 1] : [0.4, 1],
          colors: [
            Colors.white,
            getTypeColor(pokemon.types[0]),
            if (pokemon.types.length > 1) getTypeColor(pokemon.types[1]),
          ],
        ),
      ),
      child: InkWell(
        onTap: () {
          if (widget.species.id != pokemon.id) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return PokemonDetailsPage(pokemonId: pokemon.id);
                },
              ),
            );
          }
        },
        child: Column(
          children: [
            CachedNetworkImage(
              key: UniqueKey(),
              imageUrl: AppSettings.getPokemonImageUrl(pokemon.id),
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
                  const Center(child: Icon(Icons.error)),
            ),
            Text(getPokemonIdString(pokemon.id)),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                pokemon.names[AppSettings.defaultLanguage]!,
                // style: textThemeSmall.headline6,
              ),
            ),
            verticalSpace(),
            Row(
              children: [
                TypeChip(type: pokemon.types[0], isSmall: true),
              ],
            ),
            verticalSpace(),
            if (pokemon.types.length > 1)
              Row(
                children: [
                  TypeChip(type: pokemon.types[1], isSmall: true),
                ],
              ),
            if (pokemon.types.length > 1) verticalSpace(),
          ],
        ),
      ),
    );
  }
}
