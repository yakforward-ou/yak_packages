import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/extension/all.dart';
import 'package:yak_test/src/yak_runner/factory/all.dart';

void main() {
  group('`TryRunArgAsyncTestFactoryExtension` test', () {
    test(
        'WHEN `TryRunArgAsync` buildTestFactory  THEN returns `TryRunArgAsyncTestFactory`',
        () async {
      final runner = TryRunArgAsync<String>((_) => throw '');
      final testFactory = runner.buildTestFactory('');

      expect(
        testFactory is TryRunArgAsyncTestFactory,
        true,
        reason: 'testFactory should be `TryRunArgAsyncTestFactory`',
      );
    });
  });
}
