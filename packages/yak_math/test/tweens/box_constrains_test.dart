import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yak_math/yak_math.dart';

// ignore_for_file: avoid_catching_errors

void main() {
  group('`YakBoxConstraintsTween` test', () {
    const lerp = 1 / 3;

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
        yakTween.lerp(lerp),
        tween.lerp(lerp),
        reason: '`YakBoxConstraintsTween` & `BoxConstraintsTween` '
            'lerp the same output',
      );
    });

    test(
        'WHEN  both `begin` || `end` `minWidth` is `double.infinity`'
        'THEN assertion is thrown', () {
      const _end = BoxConstraints(
        maxHeight: 400,
        maxWidth: 400,
        minHeight: 200,
        minWidth: double.infinity,
      );
      const yakTween = YakBoxConstraintsTween(begin: begin, end: _end);

      late final AssertionError? err;

      try {
        yakTween.lerp(lerp);
      } on AssertionError catch (e) {
        err = e;
      }

      expect(
        err != null,
        true,
        reason: '`AssertionError` should be thrown',
      );
    });

    test(
        'WHEN  both `begin` || `end` `minHeight` is `double.infinity`'
        'THEN assertion is thrown', () {
      const _end = BoxConstraints(
        maxHeight: 400,
        maxWidth: 400,
        minHeight: double.infinity,
        minWidth: 200,
      );
      const yakTween = YakBoxConstraintsTween(begin: begin, end: _end);

      late final AssertionError? err;

      try {
        yakTween.lerp(lerp);
      } on AssertionError catch (e) {
        err = e;
      }

      expect(
        err != null,
        true,
        reason: '`AssertionError` should be thrown',
      );
    });

    test(
        'WHEN  both `begin` || `end` `maxWidth` is `double.infinity`'
        'THEN assertion is thrown', () {
      const _end = BoxConstraints(
        maxHeight: 400,
        maxWidth: double.infinity,
        minHeight: 200,
        minWidth: 200,
      );
      const yakTween = YakBoxConstraintsTween(begin: begin, end: _end);

      late final AssertionError? err;

      try {
        yakTween.lerp(lerp);
      } on AssertionError catch (e) {
        err = e;
      }

      expect(
        err != null,
        true,
        reason: '`AssertionError` should be thrown',
      );
    });

    test(
        'WHEN  both `begin` || `end` `maxHeight` is `double.infinity`'
        'THEN assertion is thrown', () {
      const _end = BoxConstraints(
        maxHeight: double.infinity,
        maxWidth: 400,
        minHeight: 200,
        minWidth: 200,
      );
      const yakTween = YakBoxConstraintsTween(begin: begin, end: _end);

      late final AssertionError? err;

      try {
        yakTween.lerp(lerp);
      } on AssertionError catch (e) {
        err = e;
      }

      expect(
        err != null,
        true,
        reason: '`AssertionError` should be thrown',
      );
    });
  });
}
