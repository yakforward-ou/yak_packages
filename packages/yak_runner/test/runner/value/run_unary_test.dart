import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('runUnary', () {
    final tester = Stub.unary<int, int>();

    setUp(tester.reset);

    test(
        'GIVEN Nullary does not throw '
        'WHEN ResultUnary.call '
        'THEN return Success', () {
      tester.stub = (x) => x * 2;

      final function = runUnary<int, int>(tester);
      final result = function(1);

      expect(
        result,
        isA<Success<int>>(),
        reason: 'tester should not throw',
      );
    });
    test(
        'GIVEN Nullary throws Exception '
        'WHEN ResultUnary.call '
        'THEN return Failure', () {
      tester.stub = (x) => throw Exception();

      final function = runUnary<int, int>(tester);
      final result = function(1);

      expect(
        result,
        isA<Failure<int>>(),
        reason: 'tester should throw',
      );
    });

    test(
        'GIVEN Nullary throws Exception '
        'WHEN ResultUnary.call '
        'THEN return Failure', () {
      tester.stub = (x) => throw Error();

      final function = runUnary<int, int>(tester);
      final result = function(1);

      expect(
        result,
        isA<Failure<int>>(),
        reason: 'tester should throw',
      );
    });
  });
}
