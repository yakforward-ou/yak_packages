import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yak_widgets/yak_widgets.dart';

// !! uncomment the line below to run as test app
//void main() => runApp(app);

class Keys {
  static const subject = ValueKey('subject');
  static const parent = ValueKey('parent');
  static const trigger = ValueKey('trigger');
}

Widget get app => const ProviderScope(child: MaterialApp(home: _MyHomePage()));

class _MyHomePage extends HookWidget {
  const _MyHomePage() : super(key: const ValueKey('MyHomePage'));

  @override
  Widget build(BuildContext context) {
    final state = useProvider(damperStatePod);
    return Scaffold(
      key: Keys.parent,
      body: Stack(children: [
        YakDamper(
          children: [
            Center(
              child: FlutterLogo(
                key: Keys.subject,
              ),
            )
          ],
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        key: Keys.trigger,
        onPressed: () => state.state = state.state == DamperState.impose
            ? DamperState.withdraw
            : DamperState.impose,
      ),
    );
  }
}
