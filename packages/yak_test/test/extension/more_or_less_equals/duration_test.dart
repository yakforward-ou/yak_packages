import 'package:test/test.dart';
import 'package:yak_test/yak_test.dart';

void main() {
  group('MoreOrLessEqualsDurationX test', () {
    const a = Duration(hours: 1);
    final b = Duration(hours: 1);
    final c = Duration(hours: 1) - Duration(minutes: 1);
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

    test(
        'GIVEN `a == null` '
        'WHEN a.moreOrLessEquals(b) '
        'THEN returns `false`', () {
      const Duration? a = null;
      expect(
        a.moreOrLessEquals(b),
        isFalse,
        reason: 'should return true',
      );
    });
  });
}
