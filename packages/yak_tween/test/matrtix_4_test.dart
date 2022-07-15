import 'package:flutter/material.dart';
import 'package:test/test.dart';
import 'package:yak_tween/yak_tween.dart';

void main() {
  group('`YakMatrix4Tween` test', () {
    test(
        'WHEN `YakMatrix4Tween` and `Matrix4Tween` lerp '
        'THEN output is identical', () {
      final begin = Matrix4.zero();
      final end = Matrix4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
      const lerp = 1 / 3;
      final yakTween = YakMatrix4Tween(begin: begin, end: end);
      final tween = Matrix4Tween(begin: begin, end: end);
      final yakTweenStorageNanFree =
          yakTween.lerp(lerp).storage.where((element) => !element.isNaN);
      final tweenStorageNaNFree =
          tween.lerp(lerp).storage.where((element) => !element.isNaN);
      expect(
        yakTweenStorageNanFree,
        tweenStorageNaNFree,
        reason: '`YakMatrix4Tween` & `Matrix4Tween` lerp '
            'should have the same value',
      );
    });
  });
}
