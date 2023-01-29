import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('unaryRunVoid<int,int>', () {
    final tester = Stub.unary<int, int>();

    setUp(tester.reset);

    test(
        'GIVEN Nullary does not throw '
        'WHEN VoidResultUnary.call '
        'THEN return Success', () {
      tester.stub = (x) => x * 2;

      final function = unaryRunVoid<int, int>(tester);
      final result = function(1);

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
        'WHEN VoidResultUnary.call '
        'THEN return Failure', () {
      tester.stub = (x) => throw Exception();

      final function = unaryRunVoid<int, int>(tester);
      final result = function(1);

      expect(
        result,
        isA<Failure<void>>(),
        reason: 'tester should throw',
      );
    });

    test(
        'GIVEN Nullary throws Exception '
        'WHEN VoidResultUnary.call '
        'THEN return Failure', () {
      tester.stub = (x) => throw Error();

      final function = unaryRunVoid<int, int>(tester);
      final result = function(1);
      expect(
        result,
        isA<Failure<void>>(),
        reason: 'tester should throw',
      );
    });
  });
}
