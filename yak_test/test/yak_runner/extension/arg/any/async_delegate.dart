import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/extension/all.dart';
import 'package:yak_test/src/yak_runner/factory/all.dart';

void main() {
  group('`TryAnyRunArgAsyncTestFactoryExtension` test', () {
    test(
        'WHEN `TryAnyRunArgAsync` buildTestFactory  THEN returns `TryAnyRunArgAsyncTestFactory`',
        () async {
      final runner = TryAnyRunArgAsync((_) => throw '');
      final testFactory = runner.buildTestFactory('');

      expect(
        testFactory is TryAnyRunArgAsyncTestFactory,
        true,
        reason: 'testFactory should be `TryAnyRunArgAsyncTestFactory`',
      );
    });
  });
}
