import 'package:test/test.dart';
import 'package:yak_runner/src/all.dart';

import 'test_factory/nullary.dart';

void main() {
  group('`YakRunnerTestMixin` MIXIN', () {
    final runner = YakRunner(() => 'hello');

    test(
        'WHEN `YakRunner<T>` calls `buildTest` '
        'THEN returns a YakRunnerTestDelegate<T>', () {
      final test = runner.buildTest(const FakeNullaryTestFactory());
      expect(
        test is YakRunnerTestDelegate<String>,
        true,
        reason: 'buildTest should return YakRunnerTestDelegate',
      );
    });
  });
}
