import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/extension/all.dart';
import 'package:yak_test/src/yak_runner/factory/all.dart';

void main() {
  group('`TryRunAsyncTestFactoryExtension` test', () {
    test(
        'WHEN `TryRunAsync` buildTestFactory  THEN returns `TryRunAsyncTestFactory`',
        () async {
      final runner = TryRunAsync(() => throw '');
      final testFactory = runner.buildTestFactory('');

      expect(
        testFactory is TryRunAsyncTestFactory,
        true,
        reason: 'testFactory should be `TryRunAsyncTestFactory`',
      );
    });
  });
}
