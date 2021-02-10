import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yak_math/yak_math.dart';

void main() {
  group('`YakBoxConstraintsTween` test', () {
    test(
        'WHEN `YakBoxConstraintsTween` and `BoxConstraintsTween` lerp '
        'THEN output is identical', () {
      const begin = BoxConstraints(
        maxHeight: 200,
        maxWidth: 200,
        minHeight: 0,
        minWidth: 0,
      );
      const end = BoxConstraints(
        maxHeight: 400,
        maxWidth: 400,
        minHeight: 200,
        minWidth: 200,
      );
      const lerp = 1 / 3;
      const yakTween = YakBoxConstraintsTween(begin: begin, end: end);
      final tween = BoxConstraintsTween(begin: begin, end: end);
      expect(
        yakTween.lerp(lerp),
        tween.lerp(lerp),
        reason: '`YakBoxConstraintsTween` & `BoxConstraintsTween` '
            'lerp the same output',
      );
    });
  });
}
