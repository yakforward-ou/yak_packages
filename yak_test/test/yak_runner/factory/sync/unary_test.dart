import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/all.dart';

typedef void TestFunction();

void main() {
  group('`YakRunnerArgTestFactory` test', () {
    test(
        'WHEN ` YakRunnerArgArg<T>` buildTest with `YakRunnerArgTestFactory` THEN returns `YakRunnerArgTest`',
        () {
      final runner = YakRunnerArg<int, String>((_) => null);
      final tester =
          runner.buildTest(YakRunnerArgTestFactory('[description goes here]'));
      expect(
        tester,
        isA<YakRunnerArgTest>(),
        reason: '`tester` should be `YakRunnerArgTest`',
      );
    });
  });
}
