import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('runCallback<int>', () {
    final tester = Stub.nullary<int>();

    setUp(tester.reset);

    test(
        'GIVEN Nullary does not throw '
        'WHEN VoidVoidResultNullary.call '
        'THEN return Success', () {
      tester.stub = () => 42;

      final function = runCallback<int>(tester);
      final result = function();

      expect(
        result,
        isA<Success>(),
        reason: 'tester should not throw',
      );

      expect(
        result,
        isA<VoidSuccess>(),
        reason: 'tester should not throw',
      );
    });
    test(
        'GIVEN Nullary throws Exception '
        'WHEN VoidResultNullary.call '
        'THEN return Failure', () {
      tester.stub = () => throw Exception();

      final result = tester.run();

      expect(
        result,
        isA<Failure<void>>(),
        reason: 'tester should throw',
      );
    });

    test(
        'GIVEN Nullary throws Exception '
        'WHEN VoidResultNullary.call '
        'THEN return Failure', () {
      tester.stub = () => throw Error();

      final result = tester.run();

      expect(
        result,
        isA<Failure<void>>(),
        reason: 'tester should throw',
      );
    });
  });
}
