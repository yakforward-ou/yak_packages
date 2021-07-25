import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_result/yak_result.dart';

void main() {
  group('`IterableContains`', () {
    test('WHEN `IterableContains<T>` contains T THEN returns `Success`', () {
      final result = [1, 2, 3, 4].containsResult(1);

      expect(
        result,
        isA<Success<int>>(),
        reason: '` [Foo].containsResult(Foo)` should be `Success`',
      );
    });

    test(
        'WHEN `IterableContains<T>` DOES NOT contains T '
        'THEN returns `Failure`', () {
      final result = [1, 2, 3, 4].containsResult(5);
      expect(
        result,
        isA<Failure<int>>(),
        reason: '`[Foo].containsResult(Bar)` should be `Failure`',
      );
    });
  });
}
