import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('ResultUnaryAsync', () {
    final tester = Stub.unary<Future<int>, int>();

    test(
        'GIVEN unary does not throw '
        'WHEN ResultUnaryAsync.call '
        'THEN return Success', () async {
      tester
        ..reset()
        ..stub = (x) => Future.sync(() => x * 2);

      final result = await tester.run(1);

      expect(
        result,
        isA<Success<int>>(),
        reason: 'tester should not throw',
      );
    });
    test(
        'GIVEN unary throws Exception '
        'WHEN ResultUnaryAsync.call '
        'THEN return Failure', () async {
      tester
        ..reset()
        ..stub = (x) => throw Exception();

      final result = await tester.run(1);

      expect(
        result,
        isA<Failure<int>>(),
        reason: 'tester should throw',
      );
    });

    test(
        'GIVEN unary throws Exception '
        'WHEN ResultUnaryAsync.call '
        'THEN return Failure', () async {
      tester
        ..reset()
        ..stub = (x) => throw Error();

      final result = await tester.run(1);

      expect(
        result,
        isA<Failure<int>>(),
        reason: 'tester should throw',
      );
    });
  });
}
