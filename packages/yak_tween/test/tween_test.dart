// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yak_tween/yak_tween.dart';

void main() {
  group('`YakTween` test', () {
    const arguments = [1.0, 2.0];
    final object = YakTween<double>(begin: arguments[0], end: arguments[1]);
    const lerp = 1 / 3;

    test('WHEN `YakTween` and `Tween` lerp THEN output is identical', () {
      final tween = Tween<double>(begin: arguments[0], end: arguments[1]);
      expect(
        object.lerp(lerp),
        tween.lerp(lerp),
        reason: '`YakTween<double>` & `Tween` lerp the same output',
      );
    });
    test('`toString` works as intended', () {
      const objectName = 'YakTween';
      final match = '$objectName<${arguments[0].runtimeType}>'
          '(${arguments[0]} \u2192 ${arguments[1]})';
      expect(
        '$object',
        match,
        reason: '`toString` output must be predictable',
      );
    });

    test('WHEN `transform` THEN output `lerp', () {
      expect(
        object.lerp(lerp),
        object.transform(lerp),
        reason: '`transform` and `lerp` should have the same output',
      );
    });
  });
}
