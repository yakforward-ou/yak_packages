import 'dart:math';

import 'package:test/test.dart';
import 'package:yak_test/yak_test.dart';

void main() {
  group('MoreOrLessEqualsNumX test', () {
    const a = sqrt2;
    final b = sqrt(2);
    const c = a - 1;
    test(
        'GIVEN `(a - b).abs() <= epsilon` '
        'WHEN a.moreOrLessEquals(b) '
        'THEN returns `true`', () {
      expect(
        a.moreOrLessEquals(b),
        isTrue,
        reason: 'should return true',
      );
    });
    test(
        'GIVEN `!(a - c).abs() <= epsilon` '
        'WHEN a.moreOrLessEquals(b) '
        'THEN returns `false`', () {
      expect(
        a.moreOrLessEquals(c),
        false,
        reason: 'should return true',
      );
    });
  });

  group('MoreOrLessEqualsMaybeIntX test', () {
    test(
        'GIVEN `a == null` '
        'WHEN a.moreOrLessEquals(b) '
        'THEN returns `false`', () {
      const double? a = null;
      final b = sqrt(2);
      expect(
        a.moreOrLessEquals(b),
        isTrue,
        reason: 'should return true',
      );
    });
    test(
        'GIVEN `a != null` '
        'WHEN a.moreOrLessEquals(b) '
        'THEN returns `num.moreOrLessEquals`', () {
      const a = null;
      final b = sqrt(2);
      expect(
        a.moreOrLessEquals(b),
        false,
        reason: 'should return true',
      );
    });
  });
}
