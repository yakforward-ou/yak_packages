import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_result/yak_result.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('runNullaryAsync', () {
    final nullary = nullaryStub<Future<int>>();
    RunNullaryAsync<int> buildTester() => runNullaryAsync(nullary.wrap);

    test(
        'GIVEN Nullary does not throw '
        'WHEN RunNullaryAsync.call '
        'THEN return Success', () async {
      nullary
        ..reset
        ..stub = () => Future.sync(() => 42);

      final tester = buildTester();
      final result = await tester();

      expect(
        result,
        isA<Success<int>>(),
        reason: 'tester should not throw',
      );
    });
    test(
        'GIVEN Nullary throws Exception '
        'WHEN RunNullaryAsync.call '
        'THEN return Failure', () async {
      nullary
        ..reset
        ..stub = () => throw Exception();

      final tester = buildTester();
      final result = await tester();

      expect(
        result,
        isA<Failure<int>>(),
        reason: 'tester should throw',
      );
    });

    test(
        'GIVEN Nullary throws Exception '
        'WHEN RunNullaryAsync.call '
        'THEN return Failure', () async {
      nullary
        ..reset
        ..stub = () => throw Error();

      final tester = buildTester();
      final result = await tester();

      expect(
        result,
        isA<Failure<int>>(),
        reason: 'tester should throw',
      );
    });
  });
}
