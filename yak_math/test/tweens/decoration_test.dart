import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yak_math/yak_math.dart';

void main() {
  group('`YakDecorationTween` test', () {
    test(
        'WHEN `YakDecorationTween` and `DecorationTween` lerp '
        'THEN output is identical', () {
      const begin = BoxDecoration(color: Color.fromRGBO(255, 0, 0, 1));
      const end = BoxDecoration(color: Color.fromRGBO(255, 255, 0, 1));
      const lerp = 1 / 3;
      const yakTween = YakDecorationTween(begin: begin, end: end);
      final tween = DecorationTween(begin: begin, end: end);
      expect(
        yakTween.lerp(lerp),
        tween.lerp(lerp),
        reason: '`YakDecorationTween` & `DecorationTween` lerp the same output',
      );
    });
  });
}
