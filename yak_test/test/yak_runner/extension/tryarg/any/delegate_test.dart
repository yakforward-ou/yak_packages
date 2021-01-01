import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/extension/all.dart';
import 'package:yak_test/src/yak_runner/factory/all.dart';

void main() {
  group('`TryAnyRunTryArgTestFactoryExtension` test', () {
    test(
        'WHEN `TryAnyRunTryArg` buildTestFactory  THEN returns `TryAnyRunTryArgTestFactory`',
        () async {
      final runner = TryAnyRunTryArg((_) => throw '', null);
      final testFactory = runner.buildTestFactory('');

      expect(
        testFactory is TryAnyRunTryArgTestFactory,
        true,
        reason: 'testFactory should be `TryAnyRunTryArgTestFactory`',
      );
    });
  });
}
