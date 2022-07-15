// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:test/test.dart';
import 'package:yak_tween/yak_tween.dart';

void main() {
  group('`YakTween` test', () {
    const arguments = [1.0, 2.0];
    final object = YakTween<double>(begin: arguments[0], end: arguments[1]);
    const t = 1 / 3;

    test('WHEN `YakTween` and `Tween` lerp THEN output is identical', () {
      final tween = Tween<double>(begin: arguments[0], end: arguments[1]);
      expect(
        object.lerp(t),
        tween.lerp(t),
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
    test('GIVEN t = 0' 'WHEN `transform` THEN output `begin', () {
      expect(
        object.transform(0),
        arguments[0],
        reason: 'should return begin',
      );
    });
    test('GIVEN t = 1' 'WHEN `transform` THEN output `end', () {
      expect(
        object.transform(1),
        arguments[1],
        reason: 'should return end',
      );
    });
    test('GIVEN 0 < t < 1' 'WHEN `transform` THEN output `lerp', () {
      expect(
        object.transform(t),
        object.lerp(t),
        reason: 'should return lerp',
      );
    });
  });
}
