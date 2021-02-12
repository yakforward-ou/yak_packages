import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yak_math/yak_math.dart';

void main() {
  group('`YakBorderRadiusTween` test', () {
    test(
        'WHEN `YakBorderRadiusTween` and `BorderRadiusTween` lerp '
        'THEN output is identical', () {
      const begin = BorderRadius.zero;
      const end = BorderRadius.all(Radius.circular(300));
      const lerp = 1 / 3;
      const yakTween = YakBorderRadiusTween(begin: begin, end: end);
      final tween = BorderRadiusTween(begin: begin, end: end);
      expect(
        yakTween.lerp(lerp),
        tween.lerp(lerp),
        reason: '`YakBorderRadiusTween` & `BorderRadiusTween` '
            'lerp the same output',
      );
    });
  });
}
