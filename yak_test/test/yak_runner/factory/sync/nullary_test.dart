import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/all.dart';

typedef void TestFunction();

void main() {
  group('`YakRunnerTestFactory` test', () {
    test(
        'WHEN ` YakRunner<T>` buildTest with `YakRunnerTestFactory` THEN returns `YakRunnerTest`',
        () {
      final runner = YakRunner<int>(() => null);
      final tester =
          runner.buildTest(YakRunnerTestFactory('[description goes here]'));
      expect(
        tester,
        isA<YakRunnerTest>(),
        reason: '`tester` should be `YakRunnerTest`',
      );
    });
  });
}
