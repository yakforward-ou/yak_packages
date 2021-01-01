import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/extension/all.dart';
import 'package:yak_test/src/yak_runner/factory/all.dart';

void main() {
  group('`TryRunArgTestFactoryExtension` test', () {
    test(
        'WHEN `TryRunArg` buildTestFactory  THEN returns `TryRunArgTestFactory`',
        () async {
      final runner = TryRunArg<String>((_) => throw '');
      final testFactory = runner.buildTestFactory('');

      expect(
        testFactory is TryRunArgTestFactory,
        true,
        reason: 'testFactory should be `TryRunArgTestFactory`',
      );
    });
  });
}
