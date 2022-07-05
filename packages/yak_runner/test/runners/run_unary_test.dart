import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('runUnarySync', () {
    final unary = unaryStub<int, int>();
    RunUnarySync<int, int> buildTester() => runUnarySync(unary.wrap);

    test(
        'GIVEN Nullary does not throw '
        'WHEN RunUnarySync.call '
        'THEN return Success', () {
      unary
        ..reset
        ..stub = (x) => x * 2;

      final tester = buildTester();
      final result = tester(1);

      expect(
        result,
        isA<Success<int>>(),
        reason: 'tester should not throw',
      );
    });
    test(
        'GIVEN Nullary throws Exception '
        'WHEN RunUnarySync.call '
        'THEN return Failure', () {
      unary
        ..reset
        ..stub = (x) => throw Exception();

      final tester = buildTester();
      final result = tester(1);

      expect(
        result,
        isA<Failure<int>>(),
        reason: 'tester should throw',
      );
    });

    test(
        'GIVEN Nullary throws Exception '
        'WHEN RunUnarySync.call '
        'THEN return Failure', () {
      unary
        ..reset
        ..stub = (x) => throw Error();

      final tester = buildTester();
      final result = tester(1);

      expect(
        result,
        isA<Failure<int>>(),
        reason: 'tester should throw',
      );
    });
  });
}
