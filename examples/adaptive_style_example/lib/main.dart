import 'package:adaptive_style/adaptive_style.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApplication());

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(context) => const AdaptiveSizeProvider(
        child: MaterialApp(
          home: MyHomePage(),
        ),
      );
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(context) => Scaffold(
        body: AdaptiveSizeBuilder(builder: (context, adaptiveSize) {
          final deviceSize = adaptiveSize.mostSimilarDeviceSize;
          return switch (deviceSize) {
            (DeviceSize.iphoneSE) => const Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: ColoredBox(
                        color: Colors.blue,
                        child: SizedBox.expand(),
                      ),
                    ),
                  ),
                ],
              ),
            _ => const Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: ColoredBox(
                        color: Colors.red,
                        child: SizedBox.expand(),
                      ),
                    ),
                  ),
                ],
              ),
          };
        }),
      );
}
