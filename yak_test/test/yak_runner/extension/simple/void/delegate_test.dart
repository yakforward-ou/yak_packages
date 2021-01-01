import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/extension/all.dart';
import 'package:yak_test/src/yak_runner/factory/all.dart';

void main() {
  group('`TryRunTestFactoryExtension` test', () {
    test('WHEN `TryRun` buildTestFactory  THEN returns `TryRunTestFactory`',
        () async {
      final runner = TryRun(() => throw '');
      final testFactory = runner.buildTestFactory('');

      expect(
        testFactory is TryRunTestFactory,
        true,
        reason: 'testFactory should be `TryRunTestFactory`',
      );
    });
  });
}
