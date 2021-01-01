import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/extension/all.dart';
import 'package:yak_test/src/yak_runner/factory/all.dart';

void main() {
  group('`TryAnyRunTryArgAsyncTestFactoryExtension` test', () {
    test(
        'WHEN `TryAnyRunTryArgAsync` buildTestFactory  THEN returns `TryAnyRunTryArgAsyncTestFactory`',
        () async {
      final runner = TryAnyRunTryArgAsync((_) => throw '', null);
      final testFactory = runner.buildTestFactory('');

      expect(
        testFactory is TryAnyRunTryArgAsyncTestFactory,
        true,
        reason: 'testFactory should be `TryAnyRunTryArgAsyncTestFactory`',
      );
    });
  });
}
