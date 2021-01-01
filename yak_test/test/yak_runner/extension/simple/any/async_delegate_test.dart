import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/extension/all.dart';
import 'package:yak_test/src/yak_runner/factory/all.dart';

void main() {
  group('`TryAnyRunAsyncTestFactoryExtension` test', () {
    test(
        'WHEN `TryAnyRunAsync` buildTestFactory  THEN returns `TryAnyRunAsyncTestFactory`',
        () async {
      final runner = TryAnyRunAsync(() => throw '');
      final testFactory = runner.buildTestFactory('');

      expect(
        testFactory is TryAnyRunAsyncTestFactory,
        true,
        reason: 'testFactory should be `TryAnyRunAsyncTestFactory`',
      );
    });
  });
}
