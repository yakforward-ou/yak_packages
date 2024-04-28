import 'package:adaptive_style/adaptive_style.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApplication());

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(context) => const SizeRefProvider(
        deviceSizes: [DeviceSize.iphoneSE],
        child: MaterialApp(
          home: MyHomePage(),
        ),
      );
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(context) => SizeRefBuilder(builder: (context, sizeRef) {
        return switch (sizeRef.size) {
          (DeviceSize.iphoneSE) => Center(
              child: SizedBox.fromSize(
                size: sizeRef.size * sizeRef.scale.min,
                child: Scaffold(
                  backgroundColor: Colors.black,
                  body: Center(
                    child: FlutterLogo(
                      size: 100 * sizeRef.scale.min,
                    ),
                  ),
                ),
              ),
            ),
          _ => const Scaffold(
              body: Center(
                child: FlutterLogo(size: 100),
              ),
            ),
        };
      });
}
