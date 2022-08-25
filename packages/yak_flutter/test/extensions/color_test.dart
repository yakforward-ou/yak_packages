import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yak_flutter/src/extensions/color.dart';
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

  group('ApplyShadeFromIntX', () {
    final validInts = [for (var i = 0; i <= 255; ++i) i];

    test(
        'GIVEN an int between 0 and 255 '
        'WHEN applyShade '
        'THEN return predictable result', () {
      for (final validInt in validInts) {
        for (final strength in strengths) {
          final shade = .5 - strength;
          final complement = shade < 0 ? validInt : 255 - validInt;
          final shaded = (complement * shade).round();
          final result = validInt + shaded;

          expect(
            validInt.applyShade(shade) == result,
            isTrue,
            reason: 'applyShade should be predictable',
          );
        }
      }
    });
  });
  group('ShadeOfColorX', () {
    const color = Colors.white;

    test(
        'GIVEN a Color '
        'WHEN color.applyShade '
        'THEN return predictable result', () {
      for (final strength in strengths) {
        final shade = .5 - strength;

        final shadedColor = Color.fromRGBO(
          color.red.applyShade(shade),
          color.green.applyShade(shade),
          color.blue.applyShade(shade),
          1,
        );

        expect(
          color.applyShade(shade) == shadedColor,
          isTrue,
          reason: 'applyShade should be predictable',
        );
      }
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

    test(
        'GIVEN ... '
        'WHEN color.swatch '
        'THEN swatch is predictable ', () {
      final swatch = color.swatch;
      expect(
        swatch.length == strengths.length,
        isTrue,
        reason: 'Swatch lenght be predictable',
      );
      for (var index = 0; index < swatch.length; ++index) {
        expect(
          swatch.keys.elementAt(index) == (strengths[index] * 1000).round(),
          isTrue,
          reason: 'Swatch keys should be predictable',
        );
        expect(
          swatch.values.elementAt(index) ==
              color.applyShade(.5 - strengths[index]),
          isTrue,
          reason: 'Swatch values should be predictable',
        );
      }
    });
  });
}
