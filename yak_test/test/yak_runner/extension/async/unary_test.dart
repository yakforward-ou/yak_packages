import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/all.dart';

void main() {
  group('`YakRunnerArgAsyncTestFactoryExtension` test', () {
    test(
        'WHEN `YakRunnerArgAsync` buildTestFactory  THEN returns `YakRunnerArgAsyncTestFactory`',
        () {
      final runner = YakRunnerArgAsync<int, String>((_) => throw '');
      final testFactory = runner.buildTestFactory('`some description`');
      expect(
        testFactory,
        isA<YakRunnerArgAsyncTestFactory>(),
        reason: 'testFactory should be `YakRunnerArgAsyncTestFactory`',
      );
    });
  });
}
