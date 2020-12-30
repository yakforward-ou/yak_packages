import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/extensions/all.dart';

void main() {
  group('`TryRunAsyncTestFactoryExtension` test', () {
    test(
        'WHEN `TryAnyRunAsync<int>` buildTester THEN returns `VoidTestDelegate`',
        () async {
      final runner = TryRunAsync(() {});
      final tester = runner.buildTester('');

      expect(
        tester is VoidTestDelegate,
        true,
        reason: 'tester should be VoidTestDelegate',
      );
    });
  });
}
