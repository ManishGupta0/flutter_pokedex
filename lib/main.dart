import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/pokemon_model.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ValueNotifier<List<PokemonModel>>>(
          create: (context) => ValueNotifier([]),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokédex',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
