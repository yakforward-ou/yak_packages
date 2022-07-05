import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/yak_test.dart';
// ignore_for_file: prefer_function_declarations_over_variables

void main() {
  group('RunUnarySyncTestX', () {
    final Unary<int, int> function = (i) => i * i;
    test(
        'GIVEN RunUnarySync runner'
        'WHEN runner.tester'
        'THEN returns `RunUnarySyncTest`', () {
      expect(
        function.run.tester,
        isA<RunUnarySyncTest<int, int>>(),
        reason: 'tester should output a `RunUnarySyncTest`',
      );
    });
  });
}
