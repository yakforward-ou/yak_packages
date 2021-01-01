import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/extension/all.dart';
import 'package:yak_test/src/yak_runner/factory/all.dart';

void main() {
  group('`TryAnyRunArgTestFactoryExtension` test', () {
    test(
        'WHEN `TryAnyRunArg` buildTestFactory  THEN returns `TryAnyRunArgTestFactory`',
        () async {
      final runner = TryAnyRunArg((_) => throw '');
      final testFactory = runner.buildTestFactory('');

      expect(
        testFactory is TryAnyRunArgTestFactory,
        true,
        reason: 'testFactory should be `TryAnyRunArgTestFactory`',
      );
    });
  });
}
