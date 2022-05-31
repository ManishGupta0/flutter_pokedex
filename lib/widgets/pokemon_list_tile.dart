import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/pokemon_model.dart';
import 'package:flutter_pokedex/utils/constants.dart';
import 'package:flutter_pokedex/utils/string_extensions.dart';
import 'package:flutter_pokedex/utils/types_color.dart';
import 'package:flutter_pokedex/models/app_settings.dart';
import 'package:flutter_pokedex/widgets/type_chip.dart';

class PokemonListTile extends StatelessWidget {
  final PokemonModel pokemon;
  final Function()? onTap;

  const PokemonListTile({Key? key, required this.pokemon, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var typeColor = getTypeColor(pokemon.types[0]);
    var hslColor = HSLColor.fromColor(getTypeColor(pokemon.types[0]));
    var lightColor = hslColor
        .withLightness((hslColor.lightness + 0.3).clamp(0, 1.0))
        .toColor();
    var darkColor = hslColor
        .withLightness((hslColor.lightness - 0.1).clamp(0, 1.0))
        .toColor();

    return Card(
      clipBehavior: Clip.hardEdge,
      // color: getTypeColor(pokemon.types[0]),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                lightColor,
                typeColor,
                darkColor,
              ],
            ),
          ),
          child: ListTileDetail(
            pokemon: pokemon,
          ),
        ),
      ),
    );
  }
}

class ListTileDetail extends StatelessWidget {
  final PokemonModel pokemon;

  const ListTileDetail({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  textBaseline: TextBaseline.alphabetic,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Text(
                      pokemon.names[AppSettings.defaultLanguage]!.toUpperCase(),
                      style: textThemeDefault.headline4,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      getPokemonIdString(pokemon.id),
                      style: textThemeDefault.headline5,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    ...pokemon.types.map(
                      (type) {
                        return TypeChip(
                          type: type,
                          isSmall: true,
                          margin: EdgeInsets.only(
                            right: pokemon.types.last.hashCode == type.hashCode
                                ? 0.0
                                : 8.0,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.all(8.0),
          child: CachedNetworkImage(
            key: UniqueKey(),
            imageUrl: AppSettings.getPokemonImageUrl(pokemon.id),
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) =>
                const Center(child: Icon(Icons.error)),
          ),
        ),
      ],
    );
  }
}
