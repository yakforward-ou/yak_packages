import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yak_math/yak_math.dart';

void main() {
  group('`YakIntTween` test', () {
    test(
        'WHEN `YakFractionalOffsetTween` and `FractionalOffsetTween` lerp '
        'THEN output is identical', () {
      const begin = FractionalOffset.bottomCenter;
      const end = FractionalOffset.topRight;
      const lerp = 1 / 3;
      const yakTween = YakFractionalOffsetTween(begin: begin, end: end);
      final tween = FractionalOffsetTween(begin: begin, end: end);
      expect(
        yakTween.lerp(lerp),
        tween.lerp(lerp),
        reason: '`YakFractionalOffsetTween` & `FractionalOffsetTween` '
            'lerp the same output',
      );
    });
  });
}
