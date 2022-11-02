import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('ResultNullaryAsync', () {
    final tester = Stub.nullary<Future<int>>();

    setUp(tester.reset);

    test(
        'GIVEN Nullary does not throw '
        'WHEN ResultNullaryAsync.call '
        'THEN return Success', () async {
      tester.stub = () => Future.sync(() => 42);

      final result = await tester.run();

      expect(
        result,
        isA<Success<int>>(),
        reason: 'tester should not throw',
      );
    });
    test(
        'GIVEN Nullary throws Exception '
        'WHEN ResultNullaryAsync.call '
        'THEN return Failure', () async {
      tester.stub = () => throw Exception();

      final result = await tester.run();

      expect(
        result,
        isA<Failure<int>>(),
        reason: 'tester should throw',
      );
    });

    test(
        'GIVEN Nullary throws Exception '
        'WHEN ResultNullaryAsync.call '
        'THEN return Failure', () async {
      tester.stub = () => throw Error();

      final result = await tester.run();

      expect(
        result,
        isA<Failure<int>>(),
        reason: 'tester should throw',
      );
    });
  });
}
