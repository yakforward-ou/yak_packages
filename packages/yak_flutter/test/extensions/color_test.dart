import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yak_flutter/yak_flutter.dart';

void main() async {
  group('MateriaColorFromColorX', () {
    const color = Colors.white;

    test('GIVEN a Color ' 'WHEN color.asMaterial ' 'THEN return MaterialColor',
        () {
      expect(
        color.asMaterial,
        isA<MaterialColor>(),
        reason: 'should return MaterialColor',
      );
    });
  });
  group('SwatchFromColorX', () {
    const color = Colors.white;
    test('GIVEN a Color ' 'WHEN color.swatch ' 'THEN return Swatch', () {
      expect(
        color.swatch,
        isA<Swatch>(),
        reason: 'should return TextTheme',
      );
    });
  });
}
