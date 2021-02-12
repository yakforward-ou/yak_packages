import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yak_math/yak_math.dart';

void main() {
  group('`YakCurveTween` test', () {
    test(
        'WHEN `YakCurveTween` and `CurveTween` transform '
        'THEN output is identical', () {
      final value = Curves.bounceIn;
      const lerp = 1 / 3;
      final yakTween = YakCurveTween(curve: value);
      final tween = CurveTween(curve: value);
      expect(
        yakTween.transform(lerp),
        tween.transform(lerp),
        reason: '`YakCurveTween` & `CurveTween` transform the same output',
      );
    });
  });
}
