import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/extension/all.dart';
import 'package:yak_test/src/yak_runner/factory/all.dart';

void main() {
  group('`TryAnyRunTestFactoryExtension` test', () {
    test(
        'WHEN `TryAnyRun` buildTestFactory  THEN returns `TryAnyRunTestFactory`',
        () async {
      final runner = TryAnyRun(() => throw '');
      final testFactory = runner.buildTestFactory('');

      expect(
        testFactory is TryAnyRunTestFactory,
        true,
        reason: 'testFactory should be `TryAnyRunTestFactory`',
      );
    });
  });
}
