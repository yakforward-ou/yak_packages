import 'package:flutter/material.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_widgets/yak_widgets.dart';

// !! uncomment the line below to run as test app
//void main() => runApp(app);

class Keys {
  static const loading = ValueKey('loading');
  static const completed = ValueKey('completed');
  static const failed = ValueKey('failed');
}

Widget app(ValueNotifier<Result<double>> progress) =>
    MaterialApp(home: Material(child: _MyHomePage(progress)));

class _MyHomePage extends StatelessWidget {
  const _MyHomePage(this._progress) : super(key: const ValueKey('_MyHomePage'));
  final ValueNotifier<Result<double>> _progress;

  @override
  Widget build(BuildContext context) {
    return Initializer(
      loadingScreen: (context, progress) => Container(key: Keys.loading),
      progressState: _progress,
      onCompleted: (context) => Container(key: Keys.completed),
      onFailed: (context) => Container(key: Keys.failed),
    );
  }
}
