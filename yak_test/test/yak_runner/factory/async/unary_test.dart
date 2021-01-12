import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/all.dart';

typedef void TestFunction();

void main() {
  group('`YakRunnerArgAsyncTestFactory` test', () {
    test(
        'WHEN ` YakRunnerArgAsyncArg<T>` buildTest with `YakRunnerArgAsyncTestFactory` THEN returns `YakRunnerArgAsyncTest`',
        () {
      final runner = YakRunnerArgAsync<int, String>((_) => null);
      final tester = runner
          .buildTest(YakRunnerArgAsyncTestFactory('[description goes here]'));
      expect(
        tester,
        isA<YakRunnerArgAsyncTest>(),
        reason: '`tester` should be `YakRunnerArgAsyncTest`',
      );
    });
  });
}
