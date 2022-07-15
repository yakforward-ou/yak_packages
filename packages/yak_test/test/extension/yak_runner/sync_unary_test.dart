import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/yak_test.dart';
// ignore_for_file: prefer_function_declarations_over_variables

void main() {
  group('ResultUnaryTestX', () {
    final Unary<int, int> function = (i) => i * i;
    test(
        'GIVEN ResultUnary runner'
        'WHEN runner.tester'
        'THEN returns `ResultUnaryTest`', () {
      expect(
        function.run.tester,
        isA<ResultUnaryTest<int, int>>(),
        reason: 'tester should output a `ResultUnaryTest`',
      );
    });
  });
}
