import 'package:flutter/material.dart';

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

/// MyHomePage
class MyHomePage extends StatefulWidget {
  /// MyHomePage

  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Counter App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), 
      );
}
