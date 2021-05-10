import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/yak_test.dart';

void main() {
  Future<String> example() async => 'example';
  final runner = RunnerAsync<String>(example);
  group('RunnerAsyncTesterX', () {
    test('WHEN runner.tester' 'THEN returns `RunnerAsyncTest`', () {
      expect(
        runner.tester,
        isA<RunnerAsyncTest<String>>(),
        reason: 'tester should output a `RunnerAsyncTest`',
      );
    });
    test('WHEN runner.tester(...)' 'THEN should not throw`', () {
      expect(
        () => runner.tester(description: 'testdrive', example: example),
        isNot(isA<Error>()),
        reason: 'tester should not throw Error',
      );
      expect(
        () => runner.tester(description: 'testdrive', example: example),
        isNot(isA<Exception>()),
        reason: 'tester should not throw Error',
      );
    });
  });
}
