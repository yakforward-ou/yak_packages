import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/yak_test.dart';

void main() {
  group('Equality Test against well known types', () {
    group('equalityTest int', () {
      const tester = 0;
      const other = 1;
      equalityTest(
        () => tester,
        () => other,
      );
    });
    group('equalityTest String', () {
      const tester = 'tester';
      const other = 'other';
      equalityTest(
        () => tester,
        () => other,
      );
    });

    group('equalityTest Success', () {
      final tester = Success.value(0);
      final other = Success.value(1);
      equalityTest(
        () => tester,
        () => other,
      );
    });
  });
}
