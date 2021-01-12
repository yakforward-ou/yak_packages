import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/all.dart';

void main() {
  group('`YakRunnerArgTestFactoryExtension` test', () {
    test(
        'WHEN `YakRunnerArg` buildTestFactory  THEN returns `YakRunnerArgTestFactory`',
        () {
      final runner = YakRunnerArg<int, String>((_) => throw '');
      final testFactory = runner.buildTestFactory('`some description`');

      expect(
        testFactory,
        isA<YakRunnerArgTestFactory>(),
        reason: 'testFactory should be `YakRunnerArgTestFactory`',
      );
    });
  });
}
