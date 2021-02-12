import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yak_math/yak_math.dart';

void main() {
  group('`YakSizeTween` test', () {
    const begin = Size.zero;
    const end = Size.square(200);
    test(
        'WHEN `YakSizeTween` and `SizeTween` lerp '
        'THEN output is identical', () {
      const lerp = 1 / 3;
      const yakTween = YakSizeTween(begin: begin, end: end);
      final tween = SizeTween(begin: begin, end: end);
      expect(
        yakTween.lerp(lerp),
        tween.lerp(lerp),
        reason: '`YakSizeTween` & `SizeTween` lerp the same output',
      );
    });
  });
}
