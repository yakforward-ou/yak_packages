import 'package:flutter/material.dart';
import 'package:test/test.dart';
import 'package:yak_tween/yak_tween.dart';

void main() {
  group('`YakDecorationTween` test', () {
    const begin = BoxDecoration(color: Color.fromRGBO(255, 0, 0, 1));
    const end = BoxDecoration(color: Color.fromRGBO(255, 255, 0, 1));
    const yakTween = YakDecorationTween(begin: begin, end: end);
    test(
        'WHEN `YakDecorationTween` and `DecorationTween` lerp '
        'THEN output is identical', () {
      const lerp = 1 / 3;
      final tween = DecorationTween(begin: begin, end: end);
      expect(
        yakTween.lerp(lerp),
        tween.lerp(lerp),
        reason: '`YakDecorationTween` & `DecorationTween` lerp the same output',
      );
    });

    test(
        'WHEN `t` == 0 lerp '
        'THEN lerp returns `begin`', () {
      const lerp = .0;

      expect(
        yakTween.lerp(lerp),
        begin,
        reason: '`lerp` should be `begin`',
      );
    });

    test(
        'WHEN `t` == 1 lerp '
        'THEN lerp returns `end`', () {
      const lerp = 1.0;

      expect(
        yakTween.lerp(lerp),
        end,
        reason: '`lerp` should be `begin`',
      );
    });
  });
}
