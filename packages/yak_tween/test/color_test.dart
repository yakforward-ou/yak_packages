import 'package:flutter/material.dart';
import 'package:test/test.dart';
import 'package:yak_tween/yak_tween.dart';

void main() {
  group('`YakColorTween` test', () {
    test(
        'WHEN `YakColorTween` and `ColorTween` lerp '
        'THEN output is identical', () {
      const begin = Color.fromRGBO(255, 0, 0, 1);
      const end = Color.fromRGBO(255, 255, 0, 1);
      const lerp = 1 / 3;
      const yakTween = YakColorTween(begin: begin, end: end);
      final tween = ColorTween(begin: begin, end: end);
      expect(
        yakTween.lerp(lerp),
        tween.lerp(lerp),
        reason: '`YakColorTween` & `ColorTween` lerp the same output',
      );
    });
  });
}
