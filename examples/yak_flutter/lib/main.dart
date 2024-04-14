import 'package:flutter/material.dart';
import 'package:yak_flutter/yak_flutter.dart';

const sixty = MonochromeThemeDelegate(
  background: Colors.white,
  foreground: Colors.black,
  error: Colors.red,
  shadow: Colors.grey,
);

const thirty = MonochromeThemeDelegate(
  background: Colors.blueAccent,
  foreground: Colors.white,
  error: Colors.red,
  shadow: Colors.blueGrey,
);

const ten = MonochromeThemeDelegate(
  background: Colors.purple,
  foreground: Colors.white,
  error: Colors.red,
  shadow: Colors.blueGrey,
);

void main() {
  runApp(const MyApp());
  // runZonedGuarded(
  //   () => runApp(const MyApp()),
  //   RecordError(),
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: sixty(ThemeData()),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

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
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ).withTheme(
        thirty(context.theme),
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
      floatingActionButton: Theme(
        data: ten(context.theme),
        child: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
