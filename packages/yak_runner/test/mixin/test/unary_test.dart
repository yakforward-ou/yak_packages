import 'package:test/test.dart';
import 'package:yak_runner/src/all.dart';

import 'test_factory/unary.dart';

void main() {
  group('`YakRunnerTestMixin` MIXIN', () {
    final runner = YakRunnerArg<String, int>((i) => '$i');

    test(
        'WHEN `YakRunnerArg<T,S>` calls `buildTest` '
        'THEN returns a YakRunnerArgTestDelegate<T,S>', () {
      final test = runner.buildTest(const FakeUnaryTestFactory());
      expect(
        test is YakRunnerArgTestDelegate<String, int>,
        true,
        reason: 'buildTest should return YakRunnerArgTestDelegate',
      );
    });
  });
}
