import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/extension/all.dart';
import 'package:yak_test/src/yak_runner/factory/all.dart';

void main() {
  group('`TryRunTryTestFactoryExtension` test', () {
    test(
        'WHEN `TryRunTry` buildTestFactory  THEN returns `TryRunTryTestFactory`',
        () async {
      final runner = TryRunTry(() => throw '', null);
      final testFactory = runner.buildTestFactory('');

      expect(
        testFactory is TryRunTryTestFactory,
        true,
        reason: 'testFactory should be `TryRunTryTestFactory`',
      );
    });
  });
}
