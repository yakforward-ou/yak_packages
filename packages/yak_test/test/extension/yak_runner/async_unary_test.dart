import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/yak_test.dart';
// ignore_for_file: prefer_function_declarations_over_variables

void main() {
  group('ResultUnaryAsyncTestX', () {
    final UnaryAsync<int, int> function = (i) async => i * i;
    test(
        'GIVEN ResultUnaryAsync runner'
        'WHEN runner.tester'
        'THEN returns `ResultUnaryAsyncTest`', () {
      expect(
        function.run.tester,
        isA<ResultUnaryAsyncTest<int, int>>(),
        reason: 'tester should output a `ResultUnaryAsyncTest`',
      );
    });
  });
}
