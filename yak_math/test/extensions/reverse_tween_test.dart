import 'package:flutter/widgets.dart';
import 'package:yak_math/yak_math.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('`ReverseYakTweenExtension` test', () {
    test('WHEN `YakTween` `reverse` THEN `begin` and `end` are swapped', () {
      const tween = YakTween(begin: 1, end: 2);
      final reverse = tween.reverse;
      expect(
        tween.begin,
        reverse.end,
        reason: '`tween.begin` should be equivalent to `reverse.end`',
      );
      expect(
        tween.end,
        reverse.begin,
        reason: '`tween.begin` should be equivalent to `reverse.end`',
      );
    });
    test('WHEN `Tween` `reverse` THEN `begin` and `end` are swapped', () {
      final tween = Tween(begin: 1, end: 2);
      final reverse = tween.reverse;
      expect(
        tween.begin,
        reverse.end,
        reason: '`tween.begin` should be equivalent to `reverse.end`',
      );
      expect(
        tween.end,
        reverse.begin,
        reason: '`tween.begin` should be equivalent to `reverse.end`',
      );
    });
  });
}
