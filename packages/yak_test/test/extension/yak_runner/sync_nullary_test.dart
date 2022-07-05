import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/yak_test.dart';
// ignore_for_file: prefer_function_declarations_over_variables

void main() {
  group('RunNullarySyncTestX', () {
    final Nullary<int> function = () => 0;
    test(
        'GIVEN RunNullarySync runner'
        'WHEN runner.tester'
        'THEN returns `RunNullarySyncTest`', () {
      expect(
        function.run.tester,
        isA<RunNullarySyncTest<int>>(),
        reason: 'tester should output a `RunNullarySyncTest`',
      );
    });
  });
}
