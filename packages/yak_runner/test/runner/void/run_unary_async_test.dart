import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('unaryRunVoidAsync<int,int>', () {
    final tester = Stub.unary<Future<int>, int>();

    setUp(tester.reset);

    test(
        'GIVEN unary does not throw '
        'WHEN VoidResultUnaryAsync.call '
        'THEN return Success', () async {
      tester.stub = (x) => Future.sync(() => x * 2);
      final function = unaryRunVoidAsync<int, int>(tester.call);
      final result = await function(1);

      expect(
        result.isSuccess,
        isTrue,
        reason: 'tester should not throw',
      );
    });
    test(
        'GIVEN unary throws Exception '
        'WHEN VoidResultUnaryAsync.call '
        'THEN return Failure', () async {
      tester.stub = (x) => throw Exception();

      final function = unaryRunVoidAsync<int, int>(tester.call);
      final result = await function(1);

      expect(
        result,
        isA<Failure<void>>(),
        reason: 'tester should throw',
      );
    });

    test(
        'GIVEN unary throws Exception '
        'WHEN VoidResultUnaryAsync.call '
        'THEN return Failure', () async {
      tester.stub = (x) => throw Error();

      final function = unaryRunVoidAsync<int, int>(tester.call);
      final result = await function(1);

      expect(
        result,
        isA<Failure<void>>(),
        reason: 'tester should throw',
      );
    });
  });
}
