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
            AdaptivePositioned(
              parentSize: parentSize,
              data: const AdaptiveAnchorData(
                dimension: 100,
                anchor: AnchorEdges.bottom(),
              ),
              builder: (context, scaleRef, parentSize) => AdaptiveStack(
                parentSize: parentSize,
                builder: (context, scaleRef, parentSize) => [
                  const SizedBox.expand(child: ColoredBox(color: Colors.red)),
                  AdaptivePositioned(
                    builder: (context, scaleRef, parentSize) =>
                        const FlutterLogo(),
                    data: const AdaptiveSizedData(
                      alignment: AdaptiveAlignment.center(),
                      size: Size.square(54),
                    ),
                    parentSize: parentSize,
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
