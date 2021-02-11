# Example

```dart
import 'package:flutter/material.dart';
import 'package:yak_math/yak_math.dart';

/// `example`

void main() => runApp(
      MaterialApp(
        home: Material(
          child: Stack(
            children: [
              const MyAnimatedWidget(),
            ],
          ),
        ),
      ),
    );

class MyAnimatedWidget extends StatefulWidget {
  const MyAnimatedWidget() : super(key: const ValueKey('MyAnimatedWidget'));

  @override
  _MyAnimatedWidgetState createState() => _MyAnimatedWidgetState();
}

class _MyAnimatedWidgetState extends State<MyAnimatedWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  static const _tween = YakAlignmentTween(
      begin: Alignment.centerLeft, end: Alignment.centerRight);

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AlignTransition(
        alignment: _tween.animate(_controller),
        child: const FlutterLogo(size: 80),
      );
}

```

[Jump to Source](https://github.com/iapicca/yak_packages/tree/master/examples/yak_math)