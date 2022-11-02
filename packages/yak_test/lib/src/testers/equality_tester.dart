import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

/// ensure [tester] over deep equality
void equalityTest<T>(
  Nullary<T> tester,
  Nullary<T> other,
) {
  /// ensure [tester] over deep equality with identical
  test(
    'GIVEN 2 instances of $T "tester" '
    'WHEN tester == other '
    'THEN returns false',
    () {
      expect(
        tester(),
        equals(tester()),
        reason: 'should be identical',
      );

      expect(
        tester().hashCode,
        equals(tester().hashCode),
        reason: 'hashCode should be identical',
      );
    },
  );

  /// ensure [tester] over deep equality against non identical
  test(
    'GIVEN 2 instances of $T "tester" and "other" '
    'WHEN tester == other '
    'THEN returns false',
    () {
      expect(
        tester(),
        isNot(equals(other())),
        reason: 'should NOT be identical',
      );

      expect(
        tester().hashCode,
        isNot(equals(other().hashCode)),
        reason: 'hashCode should NOT be identical',
      );
    },
  );
}
