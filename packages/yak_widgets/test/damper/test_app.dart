import 'package:flutter/material.dart';

import 'package:yak_widgets/yak_widgets.dart';

// !! uncomment the line below to run as test app
//void main() => runApp(app);

class Keys {
  static const subject = ValueKey('subject');
  static const parent = ValueKey('parent');
  static const trigger = ValueKey('trigger');
}

Widget get app => const MaterialApp(home: _MyHomePage());

class _MyHomePage extends StatefulWidget {
  const _MyHomePage() : super(key: const ValueKey('MyHomePage'));

  @override
  __MyHomePageState createState() => __MyHomePageState();
}

class __MyHomePageState extends State<_MyHomePage> {
  late final ValueNotifier<bool> _withdrawn;
  @override
  void initState() {
    super.initState();
    _withdrawn = ValueNotifier(false);
  }

  @override
  void dispose() {
    _withdrawn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Keys.parent,
      body: Stack(children: [
        Damper(
          withdrawn: _withdrawn,
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
          onPressed: () => _withdrawn.value = !_withdrawn.value),
    );
  }
}
