import 'package:test/test.dart';
import 'package:yak_runner/src/all.dart';

import 'test_factory/unary.dart';

void main() {
  group('`RunnerTestMixin` MIXIN', () {
    final runner = UnaryRunner<String, int>((i) => '$i');

    test(
        'WHEN `UnaryRunner<T,S>` calls `buildTest` '
        'THEN returns a UnaryRunnerTestDelegate<T,S>', () {
      final test = runner.buildTest(const FakeUnaryTestFactory());
      expect(
        test is UnaryRunnerTestDelegate<String, int>,
        true,
        reason: 'buildTest should return UnaryRunnerTestDelegate',
      );
    });
  });
}
