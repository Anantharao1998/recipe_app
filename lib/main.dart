import 'package:flutter/material.dart';
import 'package:pokemondb/features/homepage/homepage.dart';

void main() {
  runApp(const MyApp());
}

/// MyApp
class MyApp extends StatelessWidget {
  /// MyApp
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(final BuildContext context) => MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      );
}
