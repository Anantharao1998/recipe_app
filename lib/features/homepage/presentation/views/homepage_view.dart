// ignore_for_file: avoid_dynamic_calls

import 'package:flutter/material.dart';
import 'package:pokemondb/core/core.dart';
import 'package:pokemondb/features/homepage/domain/entities/get_pokemon_list.dart';

/// MyHomePage
class MyHomePage extends StatefulWidget {
  /// MyHomePage

  const MyHomePage({required this.getPokemonList, super.key});

  /// GetPokemonList instance
  final GetPokemonList getPokemonList;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String image = '';

  Future<void> _incrementCounter() async {
    final List<PokemonCard> test = await widget.getPokemonList.call();

    debugPrint(test.toString());
  }

  @override
  Widget build(final BuildContext context) => Scaffold(
        body: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              opacity: 0.3,
              image: AssetImage(
                AppAssets.pokemonBackground,
              ),
            ),
          ),
          child: Center(
            child: ImageView(imagePath: image),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      );
}
