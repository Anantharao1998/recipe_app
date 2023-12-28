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
  Future<void> _incrementCounter() async {
    /// DioService
    final DioServiceImpl dioService = locator();

    await dioService.get();
  }

  @override
  Widget build(final BuildContext context) => Scaffold(
        body: const Center(
          child: Text(
            'Flutter Tester App',
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      );
}
