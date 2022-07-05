import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('runUnaryAsync', () {
    final unary = unaryStub<Future<int>, int>();
    RunUnaryAsync<int, int> buildTester() => runUnaryAsync(unary.wrap);

    test(
        'GIVEN unary does not throw '
        'WHEN RunUnaryAsync.call '
        'THEN return Success', () async {
      unary
        ..reset
        ..stub = (x) => Future.sync(() => x * 2);

      final tester = buildTester();
      final result = await tester(1);

      expect(
        result,
        isA<Success<int>>(),
        reason: 'tester should not throw',
      );
    });
    test(
        'GIVEN unary throws Exception '
        'WHEN RunUnaryAsync.call '
        'THEN return Failure', () async {
      unary
        ..reset
        ..stub = (x) => throw Exception();

      final tester = buildTester();
      final result = await tester(1);

      expect(
        result,
        isA<Failure<int>>(),
        reason: 'tester should throw',
      );
    });

    test(
        'GIVEN unary throws Exception '
        'WHEN RunUnaryAsync.call '
        'THEN return Failure', () async {
      unary
        ..reset
        ..stub = (x) => throw Error();

      final tester = buildTester();
      final result = await tester(1);

      expect(
        result,
        isA<Failure<int>>(),
        reason: 'tester should throw',
      );
    });
  });
}
