import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yak_math/yak_math.dart';

void main() {
  group('`YakTextStyleTween` test', () {
    test(
        'WHEN `YakTextStyleTween` and `TextStyleTween` lerp '
        'THEN output is identical', () {
      const begin = TextStyle(color: Color.fromRGBO(255, 0, 0, 1));
      const end = TextStyle(color: Color.fromRGBO(255, 255, 0, 1));
      const lerp = 1 / 3;
      const yakTween = YakTextStyleTween(begin: begin, end: end);
      final tween = TextStyleTween(begin: begin, end: end);
      expect(
        yakTween.lerp(lerp),
        tween.lerp(lerp),
        reason: '`YakTextStyleTween` & `TextStyleTween` lerp the same output',
      );
    });
  });
}
