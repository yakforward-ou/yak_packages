import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/yak_test.dart';
// ignore_for_file: prefer_function_declarations_over_variables

void main() {
  group('ResultNullaryTestX', () {
    final Nullary<int> function = () => 0;
    test(
        'GIVEN ResultNullary runner'
        'WHEN runner.tester'
        'THEN returns `ResultNullaryTest`', () {
      expect(
        function.run.tester,
        isA<ResultNullaryTest<int>>(),
        reason: 'tester should output a `ResultNullaryTest`',
      );
    });
  });
}
