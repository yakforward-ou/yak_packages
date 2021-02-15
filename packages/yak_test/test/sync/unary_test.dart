import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/yak_test.dart';

final runner = YakRunnerArg<String, int>((i) => '$i');
final _test = runner.buildTest(
  runner.buildTestFactory('unary test'),
);

void main() {
  group('`YakRunnerArgTest`', () {
    test(
      'WHEN `test()` `result` is `null` '
      'THEN `assert` should `throwsAssertionError`',
      () => expect(
        () => _test(null, 1),
        throwsA(isA<AssertionError>()),
        reason: '`test()` should throw `AssertionError`',
      ),
    );
    test(
      'WHEN `test()` `arg` is `null` '
      'THEN `assert` should `throwsAssertionError`',
      () => expect(
        () => _test('hello', null),
        throwsA(isA<AssertionError>()),
        reason: '`test()` should throw `AssertionError`',
      ),
    );
  });

  _test('hello', 0);
}
