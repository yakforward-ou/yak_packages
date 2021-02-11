import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yak_math/yak_math.dart';

void main() {
  group('`YakIntTween` test', () {
    test(
        'WHEN `YakIntTween` and `IntTween` lerp '
        'THEN output is identical', () {
      const begin = 0;
      const end = 1;
      const lerp = 1 / 3;
      const yakTween = YakIntTween(begin: begin, end: end);
      final tween = IntTween(begin: begin, end: end);
      expect(
        yakTween.lerp(lerp),
        tween.lerp(lerp),
        reason: '`YakIntTween` & `IntTween` lerp the same output',
      );
    });
  });
}
