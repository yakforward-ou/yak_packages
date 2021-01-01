import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/extension/all.dart';
import 'package:yak_test/src/yak_runner/factory/all.dart';

void main() {
  group('`TryRunTryArgAsyncTestFactoryExtension` test', () {
    test(
        'WHEN `TryRunTryArgAsync` buildTestFactory  THEN returns `TryRunTryArgAsyncTestFactory`',
        () async {
      final runner = TryRunTryArgAsync((_) => throw '', null);
      final testFactory = runner.buildTestFactory('');

      expect(
        testFactory is TryRunTryArgAsyncTestFactory,
        true,
        reason: 'testFactory should be `TryRunTryArgAsyncTestFactory`',
      );
    });
  });
}
