import 'package:stub/src/counter.dart';
import 'package:test/test.dart';

void main() {
  group('Counter', () {
    const zero = 0;
    const n = 314;
    test(
        'GIVEN increase is not called '
        'WHEN count is called '
        'THEN returns `0`', () {
      final counter = Counter();
      expect(
        counter.count,
        zero,
        reason: 'count should be predicatable',
      );
    });

    test(
        'GIVEN increase is called N times'
        'WHEN count is called '
        'THEN returns `N`', () {
      final counter = Counter();

      for (var i = zero; i < n; ++i) {
        counter.increase();
      }
      expect(
        counter.count,
        n,
        reason: 'count should be predicatable',
      );
    });

    test(
        'GIVEN count > 0'
        'WHEN reset is called '
        'THEN count returns `0`', () {
      final counter = Counter();

      for (var i = zero; i < n; ++i) {
        counter.increase();
      }

      counter.reset();

      expect(
        counter.count,
        zero,
        reason: 'count should be predicatable',
      );
    });
  });
}
