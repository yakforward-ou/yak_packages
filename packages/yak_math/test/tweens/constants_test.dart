import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yak_math/yak_math.dart';

void main() {
  group('`YakConstantTween` test', () {
    const value = 100;
    const lerp = 1 / 3;
    const object = YakConstantTween(value);

    test(
        'WHEN `YakConstantTween` and `ConstantTween` lerp '
        'THEN output is identical', () {
      final tween = ConstantTween(value);
      expect(
        object.lerp(lerp),
        tween.lerp(lerp),
        reason: '`YakConstantTween` & `ConstantTween` lerp the same output',
      );
    });
    test('`toString` works as intended', () {
      const objectName = 'YakConstantTween';
      final match = '$objectName<${value.runtimeType}>(value: $value)';
      expect(
        '$object',
        match,
        reason: '`toString` output must be predictable',
      );
    });
  });
}
