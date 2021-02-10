import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yak_math/yak_math.dart';

void main() {
  group('`YakConstantTween` test', () {
    test(
        'WHEN `YakConstantTween` and `ConstantTween` lerp '
        'THEN output is identical', () {
      const value = 100;
      const lerp = 1 / 3;
      const yakTween = YakConstantTween(value);
      final tween = ConstantTween(value);
      expect(
        yakTween.lerp(lerp),
        tween.lerp(lerp),
        reason: '`YakConstantTween` & `ConstantTween` lerp the same output',
      );
    });
  });
}
