import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_pokedex/models/app_settings.dart';
import 'package:flutter_pokedex/models/poke_api_models.dart';
import 'package:flutter_pokedex/pages/home_page.dart';
import 'package:flutter_pokedex/pages/pokemon_ability.dart';
import 'package:flutter_pokedex/pages/pokemon_move.dart';
import 'package:flutter_pokedex/utils/get_pokemon_data.dart';
import 'package:flutter_pokedex/utils/utils.dart';
import 'package:flutter_pokedex/widgets/bottom_sheet.dart';
import 'package:flutter_pokedex/widgets/pokemon_evolution_tree.dart';
import 'package:flutter_pokedex/widgets/pokemon_move_tile.dart';
import 'package:flutter_pokedex/widgets/stat_bar.dart';
import 'package:flutter_pokedex/widgets/type_chip.dart';
import 'package:flutter_pokedex/utils/constants.dart';
import 'package:flutter_pokedex/utils/types_color.dart';
import 'package:flutter_pokedex/utils/string_extensions.dart';

class PokemonDetailsPage extends StatefulWidget {
  final int pokemonId;

  const PokemonDetailsPage({Key? key, required this.pokemonId})
      : super(key: key);

  @override
  State<PokemonDetailsPage> createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage> {
  late Color typeColor;
  late HSLColor hslColor;
  late Color lightColor;
  late Color darkColor;

  late Pokemon _pokemon;
  late PokemonSpecies _pokemonSpecies;

  late List<Move> _pokemonMoves;

  int _navIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  late Future<bool> _futureBasic;
  late Future<bool> _futureMoves;

  Future<bool> fetchMoves() async {
    var _res = await Future.wait([
      ..._pokemon.moves!.map((move) {
        return getPokemonMove(move.move!.url!);
      })
    ]);

    _pokemonMoves = [];
    for (var i = 0; i < _pokemon.moves!.length; i++) {
      _pokemonMoves.add(_res[i]);
    }
    if (mounted) setState(() {});
    return true;
  }

  Future<bool> fetchData() async {
    var _res = await Future.wait([
      getPokemonInfo(widget.pokemonId),
      getPokemonSpecies(widget.pokemonId),
    ]);

    _pokemon = _res[0] as Pokemon;
    _pokemonSpecies = _res[1] as PokemonSpecies;

    typeColor = getTypeColor(_pokemon.types![0].type!.name!);
    hslColor = HSLColor.fromColor(getTypeColor(_pokemon.types![0].type!.name!));
    lightColor = hslColor
        .withLightness((hslColor.lightness + 0.3).clamp(0, 1.0))
        .toColor();
    darkColor = hslColor
        .withLightness((hslColor.lightness - 0.1).clamp(0, 1.0))
        .toColor();

    if (mounted) setState(() {});

    _futureMoves = fetchMoves();
    return true;
  }

  @override
  void initState() {
    super.initState();
    lightColor = Colors.white;
    typeColor = Colors.grey;
    darkColor = Colors.red;
    _futureBasic = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Navigator.canPop(context)
            ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
              )
            : null,
      ),
      bottomNavigationBar: FutureBuilder<bool>(
        future: _futureBasic,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          return BottomNavigationBar(
            currentIndex: _navIndex,
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedItemColor: Colors.black,
            showUnselectedLabels: false,
            onTap: (index) => setState(() {
              _navIndex = index;
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeIn,
              );
            }),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.info_outline),
                label: 'Info',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.games),
                label: 'Moves',
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.add),
              //   label: 'More',
              // ),
            ],
          );
        },
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              lightColor,
              typeColor,
              darkColor,
            ],
          ),
        ),
        child: FutureBuilder<bool>(
          future: _futureBasic,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            return SafeArea(
              child: Column(
                children: [
                  detailsHeader(),
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _navIndex = index;
                        });
                      },
                      children: [
                        infoPage(),
                        movesPage(),
                        //morePage(),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Row detailsHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  textBaseline: TextBaseline.alphabetic,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Text(
                      getName(_pokemonSpecies.names!).toUpperCase(),
                      style: textThemeDefault.headline4,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      getPokemonIdString(_pokemonSpecies.id!),
                      style: textThemeDefault.headline5,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  getGenus(_pokemonSpecies.genera!),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    ..._pokemon.types!.map(
                      (type) {
                        return TypeChip(
                          type: type.type!.name!,
                          color: getTypeColor(
                            type.type!.name!,
                          ),
                          margin: EdgeInsets.only(
                            right:
                                _pokemon.types!.last.hashCode == type.hashCode
                                    ? 0.0
                                    : 8.0,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return HomePage(filter: type.type!.name!);
                                },
                              ),
                            );
                          },
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
          height: 180,
          alignment: Alignment.topCenter,
          child: CachedNetworkImage(
            key: UniqueKey(),
            imageUrl: AppSettings.getPokemonImageUrl(_pokemon.id!),
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) =>
                const Center(child: Icon(Icons.error)),
          ),
        ),
      ],
    );
  }

  ListView infoPage() {
    var _controller = ScrollController();

    return ListView(
      controller: _controller,
      children: [
        ...infoSectionWithChildren("Species", children: [
          StatBar1C(
            color: lightColor,
            text: _pokemonSpecies.flavorTextEntries!
                .firstWhere((element) =>
                    (element.language!.name == AppSettings.defaultLanguage))
                .flavorText!
                .removeNewLine(),
          ),
          StatBar2C(
            lightColor: lightColor,
            typeColor: typeColor,
            statName: "Gender Ratio",
            statValue:
                "Male: ${(8 - _pokemonSpecies.genderRate!) / 8 * 100}%, Female: ${_pokemonSpecies.genderRate! / 8 * 100}%",
          ),
          StatBar2C(
            lightColor: lightColor,
            typeColor: typeColor,
            statName: "Height",
            statValue: _pokemon.height.toString(),
          ),
          StatBar2C(
            lightColor: lightColor,
            typeColor: typeColor,
            statName: "Weight",
            statValue: _pokemon.weight.toString(),
          ),
        ]),
        ...infoSectionWithChild(
          "Abilities",
          child: Column(
            children: [
              if (_pokemon.abilities != null)
                ..._pokemon.abilities!.map(
                  (ability) {
                    return StatBar1C(
                      color: lightColor,
                      text: ability.ability!.name!.toTitle() +
                          (ability.isHidden! ? " (Hidden)" : ""),
                      onTap: () {
                        showDraggableBottomSheet(
                          context,
                          color: typeColor,
                          child: AbilityPage(ability: ability),
                        );
                      },
                    );
                  },
                ),
            ],
          ),
        ),
        ...infoSectionWithChildren(
          "Base Stat",
          children: [
            StatBar2C(
                lightColor: lightColor,
                typeColor: typeColor,
                statName: "HP",
                statValue: _pokemon.stats!
                    .firstWhere((element) => element.stat!.name == 'hp')
                    .baseStat
                    .toString()),
            StatBar2C(
                lightColor: lightColor,
                typeColor: typeColor,
                statName: "Attack",
                statValue: _pokemon.stats!
                    .firstWhere((element) => element.stat!.name == 'attack')
                    .baseStat
                    .toString()),
            StatBar2C(
                lightColor: lightColor,
                typeColor: typeColor,
                statName: "Defense",
                statValue: _pokemon.stats!
                    .firstWhere((element) => element.stat!.name == 'defense')
                    .baseStat
                    .toString()),
            StatBar2C(
                lightColor: lightColor,
                typeColor: typeColor,
                statName: "Sp. Attack",
                statValue: _pokemon.stats!
                    .firstWhere(
                        (element) => element.stat!.name == 'special-attack')
                    .baseStat
                    .toString()),
            StatBar2C(
                lightColor: lightColor,
                typeColor: typeColor,
                statName: "Sp. Defense",
                statValue: _pokemon.stats!
                    .firstWhere(
                        (element) => element.stat!.name == 'special-defense')
                    .baseStat
                    .toString()),
            StatBar2C(
                lightColor: lightColor,
                typeColor: typeColor,
                statName: "Speed",
                statValue: _pokemon.stats!
                    .firstWhere((element) => element.stat!.name == 'speed')
                    .baseStat
                    .toString()),
            const SizedBox(
              height: 10,
            ),
            Text(
              "TOTAL: ${_pokemon.stats!.fold(0, (int previousValue, element) => previousValue + element.baseStat!).toString()}",
              style: textThemeSmall.headline3,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
        ...infoSectionWithChild(
          "Evolution Chain",
          child: PokemonEvolutionTree(
            species: _pokemonSpecies,
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }

  Widget movesPage() {
    var _controller = ScrollController();

    return Column(
      children: [
        Text(
          "Moves Learned by ${getName(_pokemonSpecies.names!)}",
          style: textThemeDefault.headline3,
        ),
        verticalSpace(),
        Expanded(
          child: Container(
            color: Colors.white,
            child: FutureBuilder<bool>(
              future: _futureMoves,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                return ListView(
                  padding: const EdgeInsets.all(8.0),
                  controller: _controller,
                  children: [
                    ...List.generate(
                      _pokemonMoves.length,
                      (index) {
                        return Container(
                          width: double.maxFinite,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(8.0),
                          margin: const EdgeInsets.symmetric(vertical: 4.0),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            border: Border.all(
                              color: Colors.black,
                              width: 1.5,
                            ),
                          ),
                          child: PokemonMoveTile(
                            pokemonMove: _pokemon.moves![index],
                            move: _pokemonMoves[index],
                            onTap: () {
                              showDraggableBottomSheet(
                                context,
                                color: typeColor,
                                child: MovePage(move: _pokemonMoves[index]),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  ListView morePage() {
    var _controller = ScrollController();

    return ListView(
      controller: _controller,
      children: const [
        Text("More Page"),
      ],
    );
  }

  List<Widget> infoSectionWithChild(String title, {required Widget child}) {
    return [
      Center(
        child: Text(
          title,
          style: textThemeDefault.headline3,
        ),
      ),
      Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.white,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: child,
        ),
      ),
    ];
  }

  List<Widget> infoSectionWithChildren(String title,
      {required List<Widget> children}) {
    return [
      Center(
        child: Text(
          title,
          style: textThemeDefault.headline3,
        ),
      ),
      Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.white,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: children,
          ),
        ),
      ),
    ];
  }
}
