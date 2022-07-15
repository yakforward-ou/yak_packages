import 'package:flutter/material.dart';
import 'package:test/test.dart';
import 'package:yak_tween/yak_tween.dart';

void main() {
  group('`YakEdgeInsetsTween` test', () {
    test(
        'WHEN `YakEdgeInsetsTween` and `EdgeInsetsTween` lerp '
        'THEN output is identical', () {
      const begin = EdgeInsets.all(10);
      const end = EdgeInsets.only(left: 100);
      const lerp = 1 / 3;
      const yakTween = YakEdgeInsetsTween(begin: begin, end: end);
      final tween = EdgeInsetsTween(begin: begin, end: end);
      expect(
        yakTween.lerp(lerp),
        tween.lerp(lerp),
        reason: '`YakEdgeInsetsTween` & `EdgeInsetsTween` lerp the same output',
      );
    });
  });
}
