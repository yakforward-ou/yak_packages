import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/all.dart';

void main() {
  group('`YakRunnerAsyncTestFactoryExtension` test', () {
    test(
        'WHEN `YakRunnerAsync` buildTestFactory  THEN returns `YakRunnerAsyncTestFactory`',
        () {
      final runner = YakRunnerAsync<int>(() => throw '');
      final testFactory = runner.buildTestFactory('`some description`');

      expect(
        testFactory,
        isA<YakRunnerAsyncTestFactory>(),
        reason: 'testFactory should be `YakRunnerAsyncTestFactory`',
      );
    });
  });
}
