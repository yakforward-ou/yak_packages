import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yak_widgets/yak_widgets.dart';

void main() => runApp(
      const ProviderScope(child: MaterialApp(home: MyHomePage())),
    );

class MyHomePage extends HookWidget {
  const MyHomePage() : super(key: const ValueKey('MyHomePage'));

  @override
  Widget build(BuildContext context) {
    final _state = useProvider(handednessPod);
    return Scaffold(
      body: Stack(children: [
        YakHandedness(
          child: FlutterLogo(
            size: MediaQuery.of(context).size.shortestSide,
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _state.state = !_state.state,
      ),
    );
  }
}
