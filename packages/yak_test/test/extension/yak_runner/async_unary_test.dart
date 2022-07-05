import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/yak_test.dart';
// ignore_for_file: prefer_function_declarations_over_variables

void main() {
  group('RunUnaryAsyncTestX', () {
    final UnaryAsync<int, int> function = (i) async => i * i;
    test(
        'GIVEN RunUnaryAsync runner'
        'WHEN runner.tester'
        'THEN returns `RunUnaryAsyncTest`', () {
      expect(
        function.run.tester,
        isA<RunUnaryAsyncTest<int, int>>(),
        reason: 'tester should output a `RunUnaryAsyncTest`',
      );
    });
  });
}
