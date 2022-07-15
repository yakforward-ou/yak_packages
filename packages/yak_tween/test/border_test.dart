import 'package:flutter/material.dart';
import 'package:test/test.dart';
import 'package:yak_tween/yak_tween.dart';

void main() {
  group('`YakBorderTween` test', () {
    test(
        'WHEN `YakBorderTween` and `BorderTween` lerp '
        'THEN output is identical', () {
      final begin = Border.all();
      final end = Border.all(
        width: 200,
        color: const Color.fromRGBO(255, 0, 0, 1),
      );
      const lerp = 1 / 3;
      final yakTween = YakBorderTween(begin: begin, end: end);
      final tween = BorderTween(begin: begin, end: end);
      expect(
        yakTween.lerp(lerp),
        tween.lerp(lerp),
        reason: '`YakBorderTween` & `BorderTween` lerp the same output',
      );
    });
  });
}
