import 'dart:math';
import 'package:flutter/material.dart';
import 'package:yak_runner/yak_runner.dart';
//  ignore_for_file: undefined_named_parameter

final _random = Random();

final _api = YakRunner<int>(() {
  return _random.nextBool() ? throw Exception('ops') : _random.nextInt(10);
});

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp() : super(key: const ValueKey('MyApp'));
  @override
  Widget build(BuildContext context) => const MaterialApp(home: MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage() : super(key: const ValueKey('MyHomePage'));
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _int = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(child: Text('$_int')),
        floatingActionButton: FloatingActionButton(
          child: const Text('?'),
          onPressed: () => _api().when(
            success: (number) => setState(() => _int = number),
            failure: (e, s) => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: const Text('something went wrong')),
            ),
          ),
        ),
      );
}
