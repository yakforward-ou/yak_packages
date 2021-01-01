import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/extension/all.dart';
import 'package:yak_test/src/yak_runner/factory/all.dart';

void main() {
  group('`TryRunTryAsyncTestFactoryExtension` test', () {
    test(
        'WHEN `TryRunTryAsync` buildTestFactory  THEN returns `TryRunTryAsyncTestFactory`',
        () async {
      final runner = TryRunTryAsync(() => throw '', null);
      final testFactory = runner.buildTestFactory('');

      expect(
        testFactory is TryRunTryAsyncTestFactory,
        true,
        reason: 'testFactory should be `TryRunTryAsyncTestFactory`',
      );
    });
  });
}
