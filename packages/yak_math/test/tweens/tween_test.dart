// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yak_math/yak_math.dart';

void main() {
  group('`YakTween` test', () {
    test('WHEN `YakTween` and `Tween` lerp THEN output is identical', () {
      const lerp = 1 / 3;
      const yakTween = YakTween(begin: 1.0, end: 2.0);
      final tween = Tween(begin: 1.0, end: 2.0);
      expect(
        yakTween.lerp(lerp),
        tween.lerp(lerp),
        reason: '`YakTween` & `Tween` lerp the same output',
      );
    });

    test(
      'WHEN argument[0] is `null` THEN `assert` should fail',
      () => expect(
        () => YakTween(begin: null, end: .2),
        throwsAssertionError,
        reason: '`argument[0]` should throw AssertionError',
      ),
    );
    test(
      'WHEN argument[1] is `null` THEN `assert` should fail',
      () => expect(
        () => YakTween(begin: .0, end: null),
        throwsAssertionError,
        reason: '`argument[1]` should throw AssertionError',
      ),
    );

    test('`toString` works as intended', () {
      final arguments = [1.0, 2.0];
      final object = YakTween(begin: arguments[0], end: arguments[1]);
      final objectName = 'YakTween';

      final match = '$objectName<${arguments[0].runtimeType}>'
          '(${arguments[0]} → ${arguments[1]})';
      expect(
        '$object',
        match,
        reason: '`toString` output must be predictable',
      );
    });
  });
}
