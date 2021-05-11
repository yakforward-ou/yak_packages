import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yak_tween/yak_tween.dart';

void main() {
  group('`YakAlignmentTween` test', () {
    test(
        'WHEN `YakAlignmentTween` and `AlignmentTween` lerp '
        'THEN output is identical', () {
      const begin = Alignment.bottomCenter;
      const end = Alignment.topRight;
      const lerp = 1 / 3;
      const yakTween = YakAlignmentTween(begin: begin, end: end);
      final tween = AlignmentTween(begin: begin, end: end);
      expect(
        yakTween.lerp(lerp),
        tween.lerp(lerp),
        reason: '`YakAlignmentTween` & `AlignmentTween` lerp the same output',
      );
    });
  });
}
