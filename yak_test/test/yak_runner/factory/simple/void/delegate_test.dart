import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/factory/all.dart';

void main() {
  group('`TryRunTestFactory` test', () {
    test(
        'WHEN `TryAnyRun<int>` buildTest with `VoidTestFactoryDelegate` THEN returns `VoidTestDelegate`',
        () async {
      final runner = TryRun(() {});
      final tester = runner.buildTest(TryRunTestFactory(''));

      expect(
        tester is VoidTestDelegate,
        true,
        reason: 'tester should be VoidTestDelegate',
      );
    });
  });
}
