import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('nullaryRunAsync', () {
    final tester = Stub.nullary<Future<int>>();

    setUp(tester.reset);

    test(
        'GIVEN Nullary does not throw '
        'WHEN ResultNullaryAsync.call '
        'THEN return Success', () async {
      tester.stub = () => Future.sync(() => 42);
      final function = nullaryRunAsync<int>(tester.call);
      final result = await function();

      expect(
        result,
        isA<int>(),
        reason: 'tester should not throw',
      );

      expect(
        result.isSuccess,
        isTrue,
        reason: 'tester should not throw',
      );
    });
    test(
        'GIVEN Nullary throws Exception '
        'WHEN ResultNullaryAsync.call '
        'THEN return Failure', () async {
      tester.stub = () => throw Exception();

      final function = nullaryRunAsync<int>(tester.call);
      final result = await function();

      expect(
        result,
        isA<Failure<int>>(),
        reason: 'tester should throw',
      );

      expect(
        result.isFailure,
        isTrue,
        reason: 'tester should not throw',
      );
    });

    test(
        'GIVEN Nullary throws Exception '
        'WHEN ResultNullaryAsync.call '
        'THEN return Failure', () async {
      tester.stub = () => throw Error();

      final function = nullaryRunAsync<int>(tester.call);
      final result = await function();

      expect(
        result,
        isA<Failure<int>>(),
        reason: 'tester should throw',
      );
      expect(
        result.isFailure,
        isTrue,
        reason: 'tester should not throw',
      );
    });
  });
}
