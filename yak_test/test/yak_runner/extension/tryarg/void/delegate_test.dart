import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/extension/all.dart';
import 'package:yak_test/src/yak_runner/factory/all.dart';

void main() {
  group('`TryRunTryArgTestFactoryExtension` test', () {
    test(
        'WHEN `TryRunTryArg` buildTestFactory  THEN returns `TryRunTryArgTestFactory`',
        () async {
      final runner = TryRunTryArg((_) => throw '', null);
      final testFactory = runner.buildTestFactory('');

      expect(
        testFactory is TryRunTryArgTestFactory,
        true,
        reason: 'testFactory should be `TryRunTryArgTestFactory`',
      );
    });
  });
}
