import 'package:flutter/material.dart';
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

class _MyHomePage extends StatefulWidget {
  const _MyHomePage() : super(key: const ValueKey('MyHomePage'));

  @override
  __MyHomePageState createState() => __MyHomePageState();
}

class __MyHomePageState extends State<_MyHomePage> {
  late final ValueNotifier<bool> lefthanded;

  @override
  void initState() {
    lefthanded = ValueNotifier(false);
    super.initState();
  }

  @override
  void dispose() {
    lefthanded.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Keys.parent,
      body: Stack(children: [
        Handedness(
          lefthanded: lefthanded,
          child: FlutterLogo(
            key: Keys.subject,
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        key: Keys.trigger,
        onPressed: () => lefthanded.value = !lefthanded.value,
      ),
    );
  }
}
