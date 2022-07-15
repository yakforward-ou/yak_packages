import 'package:flutter/material.dart';
import 'package:test/test.dart';
import 'package:yak_tween/yak_tween.dart';

// ignore_for_file: avoid_catching_errors

void main() {
  group('`YakBoxConstraintsTween` test', () {
    const t = 1 / 3;

    const begin = BoxConstraints(
      maxHeight: 200,
      maxWidth: 200,
      minHeight: 0,
      minWidth: 0,
    );
    const end = BoxConstraints(
      maxHeight: 400,
      maxWidth: 400,
      minHeight: 200,
      minWidth: 200,
    );

    test(
        'WHEN `YakBoxConstraintsTween` and `BoxConstraintsTween` lerp '
        'THEN output is identical', () {
      const yakTween = YakBoxConstraintsTween(begin: begin, end: end);
      final tween = BoxConstraintsTween(begin: begin, end: end);
      expect(
        yakTween.lerp(t),
        tween.lerp(t),
        reason: '`YakBoxConstraintsTween` & `BoxConstraintsTween` '
            'lerp the same output',
      );
    });
    test(
        'WHEN  both `begin` || `end` `minWidth` is `double.infinity`'
        'THEN assertion is thrown', () {
      final beginInfinity = YakBoxConstraintsTween(
        begin: begin,
        end: end.copyWith(minWidth: double.infinity),
      );
      final endInfinity = YakBoxConstraintsTween(
        begin: begin.copyWith(minWidth: double.infinity),
        end: end,
      );

      expect(
        () => beginInfinity.lerp(t),
        throwsA(isA<AssertionError>()),
        reason: 'should thrown `AssertionError`',
      );
      expect(
        () => endInfinity.lerp(t),
        throwsA(isA<AssertionError>()),
        reason: 'should thrown `AssertionError`',
      );
    });

    test(
        'WHEN  both `begin` || `end` `minHeight` is `double.infinity`'
        'THEN assertion is thrown', () {
      final beginInfinity = YakBoxConstraintsTween(
        begin: begin,
        end: end.copyWith(minHeight: double.infinity),
      );
      final endInfinity = YakBoxConstraintsTween(
        begin: begin.copyWith(minHeight: double.infinity),
        end: end,
      );
      expect(
        () => beginInfinity.lerp(t),
        throwsA(isA<AssertionError>()),
        reason: 'should thrown `AssertionError`',
      );
      expect(
        () => endInfinity.lerp(t),
        throwsA(isA<AssertionError>()),
        reason: 'should thrown `AssertionError`',
      );
    });

    test(
        'WHEN  both `begin` || `end` `maxWidth` is `double.infinity`'
        'THEN assertion is thrown', () {
      final beginInfinity = YakBoxConstraintsTween(
        begin: begin,
        end: end.copyWith(maxWidth: double.infinity),
      );
      final endInfinity = YakBoxConstraintsTween(
        begin: begin.copyWith(maxWidth: double.infinity),
        end: end,
      );

      expect(
        () => beginInfinity.lerp(t),
        throwsA(isA<AssertionError>()),
        reason: 'should thrown `AssertionError`',
      );
      expect(
        () => endInfinity.lerp(t),
        throwsA(isA<AssertionError>()),
        reason: 'should thrown `AssertionError`',
      );
    });

    test(
        'WHEN  both `begin` || `end` `maxHeight` is `double.infinity`'
        'THEN assertion is thrown', () {
      final beginInfinity = YakBoxConstraintsTween(
        begin: begin,
        end: end.copyWith(maxHeight: double.infinity),
      );
      final endInfinity = YakBoxConstraintsTween(
        begin: begin.copyWith(maxHeight: double.infinity),
        end: end,
      );

      expect(
        () => beginInfinity.lerp(t),
        throwsA(isA<AssertionError>()),
        reason: 'should thrown `AssertionError`',
      );
      expect(
        () => endInfinity.lerp(t),
        throwsA(isA<AssertionError>()),
        reason: 'should thrown `AssertionError`',
      );
    });
  });
}
