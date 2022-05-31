import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/poke_api_models.dart';
import 'package:flutter_pokedex/utils/constants.dart';
import 'package:flutter_pokedex/utils/string_extensions.dart';
import 'package:flutter_pokedex/utils/types_color.dart';
import 'package:flutter_pokedex/utils/utils.dart';
import 'package:flutter_pokedex/widgets/type_chip.dart';

class PokemonMoveTile extends StatelessWidget {
  final PokemonMove pokemonMove;
  final Move? move;
  final Function()? onTap;

  const PokemonMoveTile(
      {Key? key, required this.pokemonMove, this.move, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            getName(move!.names!),
            style: textThemeSmall.headline3,
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Expanded(
                child: Text(
                  "Level",
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text(
                  "Method",
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          verticalSpace(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Text(
                  pokemonMove.versionGroupDetails!.last.levelLearnedAt
                      .toString(),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text(
                  getStringFromName(pokemonMove
                      .versionGroupDetails!.last.moveLearnMethod!.name!),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          // verticalSpace(),
          const Divider(),
          if (move != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Expanded(
                  child: Text(
                    "Type",
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    "Class",
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          verticalSpace(),
          if (move != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TypeChip(
                  type: move!.type!.name!,
                  color: getTypeColor(move!.type!.name!),
                ),
                const SizedBox(width: 10),
                TypeChip(
                  type: move!.damageClass!.name!.toTitle(),
                  color: Colors.black,
                ),
              ],
            ),
          verticalSpace(),
          const Divider(),
          if (move != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Expanded(
                  child: Text(
                    "Power",
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    "PP",
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    "Accuracy",
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          verticalSpace(),
          if (move != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    getValueForNull(move!.power, "-").toString(),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    getValueForNull(move!.pp, "-").toString(),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    getValueForNull(move!.accuracy, "-").toString(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
