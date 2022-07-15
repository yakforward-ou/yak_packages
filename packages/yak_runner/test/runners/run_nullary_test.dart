import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('ResultNullary', () {
    final tester = Stub.nullary<int>();

    test(
        'GIVEN Nullary does not throw '
        'WHEN ResultNullary.call '
        'THEN return Success', () {
      tester
        ..reset()
        ..stub = () => 42;

      final result = tester.run();

      expect(
        result,
        isA<Success<int>>(),
        reason: 'tester should not throw',
      );
    });
    test(
        'GIVEN Nullary throws Exception '
        'WHEN ResultNullary.call '
        'THEN return Failure', () {
      tester
        ..reset()
        ..stub = () => throw Exception();

      final result = tester.run();

      expect(
        result,
        isA<Failure<int>>(),
        reason: 'tester should throw',
      );
    });

    test(
        'GIVEN Nullary throws Exception '
        'WHEN ResultNullary.call '
        'THEN return Failure', () {
      tester
        ..reset()
        ..stub = () => throw Error();

      final result = tester.run();

      expect(
        result,
        isA<Failure<int>>(),
        reason: 'tester should throw',
      );
    });
  });
}
