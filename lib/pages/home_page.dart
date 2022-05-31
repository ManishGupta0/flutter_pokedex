import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pokedex/utils/get_pokemon_data.dart';
import 'dart:convert' as convert;
import 'package:flutter_pokedex/models/pokemon_model.dart';
import 'package:flutter_pokedex/pages/pokemon_details.dart';
import 'package:flutter_pokedex/utils/constants.dart';
import 'package:flutter_pokedex/widgets/pokemon_list_tile.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  final String filter;

  const HomePage({Key? key, this.filter = ""}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<PokemonModel>>? _pokemonData;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> _setup() async {
    var provider =
        Provider.of<ValueNotifier<List<PokemonModel>>>(context, listen: false);
    final SharedPreferences prefs = await _prefs;

    if (prefs.containsKey("pokemonList")) {
      Iterable l = convert.jsonDecode(prefs.getString("pokemonList")!);
      final List<PokemonModel> dataList = List<PokemonModel>.from(
          l.map((model) => PokemonModel.fromJson(model)));

      provider.value = dataList;
    }

    if (provider.value.isEmpty) {
      _pokemonData = getBasicPokemonData();
      _pokemonData!.then((value) {
        provider.value = value;

        setState(() {
          prefs.setString("pokemonList", convert.jsonEncode(provider.value));
        });
      });
    } else {
      var completer = Completer<List<PokemonModel>>();
      completer.complete(provider.value);
      setState(() {
        _pokemonData = completer.future;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _setup();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          widget.filter.isNotEmpty ? "Type: ${widget.filter}" : "Pokémons",
          style: textThemeDefault.headline2!.copyWith(color: Colors.white),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
            colors: [Colors.greenAccent, Colors.blue, Colors.greenAccent],
          ),
        ),
        child: SafeArea(
          child: FutureBuilder<List<PokemonModel>>(
            future: _pokemonData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  children: snapshot.data!
                      .where((element) => (widget.filter.isEmpty ||
                          element.types.contains(widget.filter)))
                      .map((pokemon) {
                    return SizedBox(
                      height: 120,
                      child: PokemonListTile(
                        pokemon: pokemon,
                        onTap: () {
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
                  }).toList(),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
