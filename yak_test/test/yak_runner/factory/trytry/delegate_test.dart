import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/factory/all.dart';

void main() {
  group('`TryRunTryTestFactory` test', () {
    test(
        'WHEN `TryRunTry<int>` buildTest with `VoidTestFactoryDelegate` THEN returns `VoidTestDelegate`',
        () async {
      final runner = TryRunTry(() {}, null);
      final tester = runner.buildTest(TryRunTryTestFactory(''));

      expect(
        tester is VoidTestDelegate,
        true,
        reason: 'tester should be VoidTestDelegate',
      );
    });
  });
}
