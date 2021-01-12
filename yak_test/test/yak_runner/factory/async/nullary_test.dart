import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/all.dart';

typedef void TestFunction();

void main() {
  group('`YakRunnerAsyncTestFactory` test', () {
    test(
        'WHEN ` YakRunnerAsync<T>` buildTest with `YakRunnerAsyncTestFactory` THEN returns `YakRunnerAsyncTest`',
        () {
      final runner = YakRunnerAsync<int>(() => null);
      final tester = runner
          .buildTest(YakRunnerAsyncTestFactory('[description goes here]'));
      expect(
        tester,
        isA<YakRunnerAsyncTest>(),
        reason: '`tester` should be `YakRunnerAsyncTest`',
      );
    });
  });
}
