import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

/// ensure [tester] over deep equality
void equalityTest<T>(
  Nullary<T> tester,
  Nullary<T> other,
) {
  /// ensure [tester] over deep equality with identical
  test('GIVEN $T' 'WHEN == with ideantical' 'THEN returns true', () {
    expect(
      tester,
      equals(tester),
      reason: 'should be identical',
    );
  });

  /// ensure [tester] over deep equality against non identical
  test('GIVEN $T' 'WHEN == with not identical ' 'THEN returns false', () {
    expect(
      tester == other,
      isFalse,
      reason: 'should NOT be identical',
    );
  });
}
