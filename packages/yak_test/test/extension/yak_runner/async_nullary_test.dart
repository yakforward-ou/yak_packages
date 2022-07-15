import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/yak_test.dart';
// ignore_for_file: prefer_function_declarations_over_variables

void main() {
  group('ResultNullaryAsyncTestX', () {
    final NullaryAsync<int> function = () async => 0;
    test(
        'GIVEN ResultNullaryAsync runner'
        'WHEN runner.tester'
        'THEN returns `ResultNullaryAsyncTest`', () {
      expect(
        function.run.tester,
        isA<ResultNullaryAsyncTest<int>>(),
        reason: 'tester should output a `ResultNullaryAsyncTest`',
      );
    });
  });
}
