// ignore_for_file: avoid_dynamic_calls

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokemondb/core/core.dart';

/// MyHomePage
class MyHomePage extends StatefulWidget {
  /// MyHomePage

  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String image = '';

  Future<void> _incrementCounter() async {
    /// DioService
    final DioClient dioService = locator();

    final Response<dynamic> response = await dioService.get(
      'cards',
      queryParameters: <String, dynamic>{'pageSize': 1},
    );
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
