import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/yak_test.dart';

final runner = YakRunnerAsync(() async => 0);
final _test = runner.buildTest(
  runner.buildTestFactory('unary test'),
);

void main() {
  group('`YakRunnerAsyncTest`', () {
    test(
      'WHEN `test()` `result` is `null` '
      'THEN `assert` should `throwsAssertionError`',
      () => expect(
        () => _test(null),
        throwsA(isA<AssertionError>()),
        reason: '`test()` should throw `AssertionError`',
      ),
    );
  });

  _test(0);
}
