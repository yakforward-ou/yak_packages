import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yak_math/yak_math.dart';

void main() {
  group('`YakAlignmentGeometryTween` test', () {
    test(
        'WHEN `YakAlignmentGeometryTween` and `AlignmentGeometryTween` lerp '
        'THEN output is identical', () {
      const begin = Alignment.bottomCenter;
      const end = Alignment.topRight;
      const lerp = 1 / 3;
      const yakTween = YakAlignmentGeometryTween(begin: begin, end: end);
      final tween = AlignmentGeometryTween(begin: begin, end: end);
      expect(
        yakTween.lerp(lerp),
        tween.lerp(lerp),
        reason: '`YakAlignmentGeometryTween` & `AlignmentGeometryTween` '
            'lerp the same output',
      );
    });
  });
}
