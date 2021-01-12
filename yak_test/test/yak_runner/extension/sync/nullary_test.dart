import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/all.dart';

void main() {
  group('`YakRunnerTestFactoryExtension` test', () {
    test(
        'WHEN `YakRunner` buildTestFactory  THEN returns `YakRunnerTestFactory`',
        () {
      final runner = YakRunner<int>(() => throw '');
      final testFactory = runner.buildTestFactory('`some description`');

      expect(
        testFactory,
        isA<YakRunnerTestFactory>(),
        reason: 'testFactory should be `YakRunnerTestFactory`',
      );
    });
  });
}
