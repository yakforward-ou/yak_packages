import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('nullaryRun', () {
    final tester = Stub.nullary<int>();

    setUp(tester.reset);

    test(
        'GIVEN Nullary does not throw '
        'WHEN ResultNullary.call '
        'THEN return Success', () {
      tester.stub = () => 42;

      final function = nullaryRun<int>(tester.call);
      final result = function();

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
      tester.stub = () => throw Exception();

      final function = nullaryRun<int>(tester.call);
      final result = function();

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
      tester.stub = () => throw Error();

      final function = nullaryRun<int>(tester.call);
      final result = function();

      expect(
        result,
        isA<Failure<int>>(),
        reason: 'tester should throw',
      );
    });
  });
}
