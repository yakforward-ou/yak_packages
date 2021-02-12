import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yak_math/yak_math.dart';

void main() {
  group('`YakCurveTween` test', () {
    final value = Curves.bounceIn;
    final yakTween = YakCurveTween(curve: value);

    test(
        'WHEN `YakCurveTween` and `CurveTween` transform '
        'THEN output is identical', () {
      const lerp = 1 / 3;
      final tween = CurveTween(curve: value);
      expect(
        yakTween.transform(lerp),
        tween.transform(lerp),
        reason: '`YakCurveTween` & `CurveTween` transform the same output',
      );
    });
    test('`toString` works as intended', () {
      final argumentName = 'curve: ';
      final objectName = 'YakCurveTween';
      final match = '$objectName($argumentName$value)';
      expect(
        '$yakTween',
        match,
        reason: '`toString` output must be predictable',
      );
    });
  });
}
