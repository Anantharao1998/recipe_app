// ignore_for_file: avoid_dynamic_calls

import 'package:flutter/material.dart';
import 'package:pokemondb/core/core.dart';
import 'package:pokemondb/features/homepage/homepage.dart';

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
  final List<PokemonCard> test = <PokemonCard>[];

  Future<void> _incrementCounter() async {
    test.addAll(await widget.getPokemonList.call());

    debugPrint(test.toString());
  }

  @override
  Widget build(final BuildContext context) => Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              opacity: 0.3,
              image: AssetImage(
                AppAssets.backgroundImage,
              ),
            ),
          ),
          child: const SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: kToolbarHeight,
                ),
                GoalsTile(
                  dailyGoalEntity: DailyGoalEntity(
                    totalAppointmentCompleted: 20,
                    totalAppointmentFixed: 20,
                    totalProspect: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      );
}
