import 'dart:async';

import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/yak_test.dart';

void main() {
  final argument = 'hello';
  Future<int> example(FutureOr<String> s) async => (await s).length;
  final runner = UnaryRunnerAsync<int, String>(example);
  group('UnaryRunnerTesterX', () {
    test(
        'WHEN runner.tester'
        'THEN returns `UnaryRunnerTest`', () {
      expect(
        runner.tester,
        isA<UnaryRunnerAsyncTest<int, String>>(),
        reason: 'tester should output a `UnaryRunnerAsyncTest`',
      );
    });
    test('WHEN runner.tester(...)' 'THEN should not throw`', () {
      expect(
        () => runner.tester(
          description: 'testdrive',
          example: example,
          argument: argument,
        ),
        isNot(isA<Error>()),
        reason: 'tester should not throw Error',
      );
      expect(
        () => runner.tester(
          description: 'testdrive',
          example: example,
          argument: argument,
        ),
        isNot(isA<Exception>()),
        reason: 'tester should not throw Error',
      );
    });
  });
}
