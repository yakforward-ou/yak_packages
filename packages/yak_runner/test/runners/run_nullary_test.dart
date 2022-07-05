import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('runNullarySync', () {
    final nullary = nullaryStub<int>();
    RunNullarySync<int> buildTester() => runNullarySync(nullary.wrap);

    test(
        'GIVEN Nullary does not throw '
        'WHEN RunNullarySync.call '
        'THEN return Success', () {
      nullary
        ..reset
        ..stub = () => 42;

      final tester = buildTester();
      final result = tester();

      expect(
        result,
        isA<Success<int>>(),
        reason: 'tester should not throw',
      );
    });
    test(
        'GIVEN Nullary throws Exception '
        'WHEN RunNullarySync.call '
        'THEN return Failure', () {
      nullary
        ..reset
        ..stub = () => throw Exception();

      final tester = buildTester();
      final result = tester();

      expect(
        result,
        isA<Failure<int>>(),
        reason: 'tester should throw',
      );
    });

    test(
        'GIVEN Nullary throws Exception '
        'WHEN RunNullarySync.call '
        'THEN return Failure', () {
      nullary
        ..reset
        ..stub = () => throw Error();

      final tester = buildTester();
      final result = tester();

      expect(
        result,
        isA<Failure<int>>(),
        reason: 'tester should throw',
      );
    });
  });
}
