import 'package:flutter/material.dart';
import 'package:yak_widgets/yak_widgets.dart';

main() => runApp(const MaterialApp(home: MyHomePage()));

class MyHomePage extends StatefulWidget {
  const MyHomePage() : super(key: const ValueKey('MyHomePage'));

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      body: Stack(children: [
        Damper(
          withdrawn: _withdrawn,
          children: [
            Center(
              child: FlutterLogo(),
            )
          ],
        ),
      ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _withdrawn.value = !_withdrawn.value),
    );
  }
}
