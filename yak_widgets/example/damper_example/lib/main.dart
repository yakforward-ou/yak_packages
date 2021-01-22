import 'package:yak_widgets/yak_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() => runApp(
      const ProviderScope(child: MaterialApp(home: MyHomePage())),
    );

class MyHomePage extends HookWidget {
  const MyHomePage() : super(key: const ValueKey('MyHomePage'));

  @override
  Widget build(BuildContext context) {
    final _state = useProvider(damperStatePod);
    return Scaffold(
      body: Stack(children: [
        DamperWidget(
          children: [
            FlutterLogo(size: MediaQuery.of(context).size.shortestSide),
          ],
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _state.state = _state.state == DamperState.impose
            ? DamperState.withdraw
            : DamperState.impose,
      ),
    );
  }
}
