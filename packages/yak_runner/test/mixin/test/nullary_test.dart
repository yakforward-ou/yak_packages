import 'package:test/test.dart';
import 'package:yak_runner/src/all.dart';

import 'test_factory/nullary.dart';

void main() {
  group('`RunnerTestMixin` MIXIN', () {
    final runner = Runner(() => 'hello');

    test(
        'WHEN `Runner<T>` calls `buildTest` '
        'THEN returns a RunnerTestDelegate<T>', () {
      final test = runner.buildTest(const FakeNullaryTestFactory());
      expect(
        test is RunnerTestDelegate<String>,
        true,
        reason: 'buildTest should return RunnerTestDelegate',
      );
    });
  });
}
