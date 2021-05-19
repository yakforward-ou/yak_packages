import 'dart:math';

import 'package:test/test.dart';
import 'package:yak_test/yak_test.dart';

void main() {
  const b = sqrt2;
  const c = b - 1;
  group('MoreOrLessEqualsNumX test', () {
    final a = sqrt(2);
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
        isFalse,
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
      expect(
        a.moreOrLessEquals(b),
        isFalse,
        reason: 'should return true',
      );
    });
    test(
        'GIVEN `a != null` '
        'WHEN a.moreOrLessEquals(b) '
        'THEN returns `num.moreOrLessEquals`', () {
      final a = sqrt(2);

      expect(
        a.moreOrLessEquals(b),
        isTrue,
        reason: 'should return true',
      );
    });
  });
}
