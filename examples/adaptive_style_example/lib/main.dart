import 'package:adaptive_style/adaptive_style.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApplication());

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(context) => ScaleRefProvider(
        deviceSizes: const [DeviceSize.iphoneSE],
        builder: (context) => const MaterialApp(
          home: MyHomePage(),
        ),
      );
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(context) => Material(
        child: AdaptiveStackBuilder(
          builder: (context, scaleRef, parentSize) => [
            AdaptiveEdgePositioned(
              parentSize: parentSize,
              padding: const EdgeInsets.all(10),
              dimension: 100,
              edge: Edge.bottom,
              builder: (context, scaleRef, parentSize) => const ColoredBox(
                color: Colors.red,
              ),
            ),
          ],
        ),
        // child: AdaptiveEdgePositioned(
        //   padding: const EdgeInsets.all(10),
        //   dimension: 100,
        //   edge: Edge.bottom,
        //   builder: (context, scaleRef, _) => const ColoredBox(
        //     color: Colors.red,
        //   ),
        // ),
      );
}
