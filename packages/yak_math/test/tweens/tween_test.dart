// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yak_math/yak_math.dart';

void main() {
  group('`YakTween` test', () {
    test('WHEN `YakTween` and `Tween` lerp THEN output is identical', () {
      const lerp = 1 / 3;
      const yakTween = YakTween(begin: 1.0, end: 2.0);
      final tween = Tween(begin: 1.0, end: 2.0);
      expect(
        yakTween.lerp(lerp),
        tween.lerp(lerp),
        reason: '`YakTween` & `Tween` lerp the same output',
      );
    });
  });
}
