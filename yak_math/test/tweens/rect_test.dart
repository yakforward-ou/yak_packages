import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yak_math/yak_math.dart';

void main() {
  group('`YakRectTween` test', () {
    test(
        'WHEN `YakRectTween` and `RectTween` lerp '
        'THEN output is identical', () {
      final begin = Rect.fromCenter(center: Offset.zero, width: 0, height: 0);
      final end = Rect.fromCenter(center: Offset.zero, width: 100, height: 100);
      const lerp = 1 / 3;
      final yakTween = YakRectTween(begin: begin, end: end);
      final tween = RectTween(begin: begin, end: end);
      expect(
        yakTween.lerp(lerp),
        tween.lerp(lerp),
        reason: '`YakRectTween` & `RectTween` lerp the same output',
      );
    });
  });
}
