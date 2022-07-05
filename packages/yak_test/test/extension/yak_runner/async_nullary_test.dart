import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/yak_test.dart';
// ignore_for_file: prefer_function_declarations_over_variables

void main() {
  group('RunNullaryAsyncTestX', () {
    final NullaryAsync<int> function = () async => 0;
    test(
        'GIVEN RunNullaryAsync runner'
        'WHEN runner.tester'
        'THEN returns `RunNullaryAsyncTest`', () {
      expect(
        function.run.tester,
        isA<RunNullaryAsyncTest<int>>(),
        reason: 'tester should output a `RunNullaryAsyncTest`',
      );
    });
  });
}
