import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('nullaryRunVoidAsync<int>', () {
    final tester = Stub.nullary<Future<int>>();

    setUp(tester.reset);

    test(
        'GIVEN Nullary does not throw '
        'WHEN VoidResultNullaryAsync.call '
        'THEN return Success', () async {
      tester.stub = () => Future.sync(() => 42);
      final function = nullaryRunVoidAsync<int>(tester.call);
      final result = await function();

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
        'WHEN VoidResultNullaryAsync.call '
        'THEN return Failure', () async {
      tester.stub = () => throw Exception();
      final function = nullaryRunVoidAsync<int>(tester.call);
      final result = await function();

      expect(
        result,
        isA<Failure<void>>(),
        reason: 'tester should throw',
      );
    });

    test(
        'GIVEN Nullary throws Exception '
        'WHEN VoidResultNullaryAsync.call '
        'THEN return Failure', () async {
      tester.stub = () => throw Error();
      final function = nullaryRunVoidAsync<int>(tester.call);
      final result = await function();

      expect(
        result,
        isA<Failure<void>>(),
        reason: 'tester should throw',
      );
    });
  });
}
