import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/yak_test.dart';

void main() {
  String example() => 'example';
  final runner = Runner<String>(example);
  group('RunnerTesterX', () {
    test('WHEN runner.tester' 'THEN returns `RunnerTest`', () {
      expect(
        runner.tester,
        isA<RunnerTest<String>>(),
        reason: 'tester should output a `RunnerTest`',
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
