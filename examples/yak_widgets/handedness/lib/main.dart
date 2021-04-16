import 'package:flutter/material.dart';
import 'package:yak_widgets/yak_widgets.dart';

main() => runApp(const MaterialApp(home: MyHomePage()));

class MyHomePage extends StatefulWidget {
  const MyHomePage() : super(key: const ValueKey('MyHomePage'));

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      body: Stack(children: [
        Handedness(
          lefthanded: lefthanded,
          child: FlutterLogo(),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => lefthanded.value = !lefthanded.value,
      ),
    );
  }
}
