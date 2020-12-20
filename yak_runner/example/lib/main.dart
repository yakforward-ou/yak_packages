import 'package:flutter/material.dart';
import 'package:yak_runner/yak_runner.dart';
import 'dart:math';

final _random = Random();
int _randomNumberOrError() =>
    _random.nextBool() ? throw 'ops' : _random.nextInt(10);
final _veryBadRandomNumberGenerator = TryAnyRun<int>(_randomNumberOrError);

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp() : super(key: const ValueKey('MyApp'));

  @override
  Widget build(BuildContext context) => const MaterialApp(
        home: MyHomePage(),
      );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage() : super(key: const ValueKey('MyHomePage'));

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _randomNumberOrError = TryAny.result(0);

  void _tryYourLuck() =>
      setState(() => _randomNumberOrError = _veryBadRandomNumberGenerator());

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: _randomNumberOrError.when(
            result: (int i) => Text('your lucky number is $i'),
            failure: (_, __) => const Text('ops'),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: _tryYourLuck,
          child: const Center(
            child: Text(
              '?',
              textScaleFactor: 2,
            ),
          ),
        ),
      );
}
