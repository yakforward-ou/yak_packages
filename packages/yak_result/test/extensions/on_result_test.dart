import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_result/yak_result.dart';

void main() {
  group('OnResultX', () {
    final result = nullaryStub<Result<bool>>();
    final function = unaryStub<Result<bool>, bool>()..stub = (i) => Success(!i);
    test('GIVEN ... ' 'WHEN is Success' 'THEN function is called', () {
      function.reset;
      result
        ..reset
        ..stub = () => const Success(true);

      expect(
        result.wrap().onResult(function.wrap),
        isA<Success>(),
        reason: 'should be a success',
      );

      expect(
        function.count,
        1,
        reason: 'should called once',
      );
    });

    test('GIVEN ... ' 'WHEN is Failure' 'THEN function is called', () {
      function.reset;
      result
        ..reset
        ..stub = () => Failure();
      expect(
        result.wrap().onResult(function.wrap),
        isA<Failure<bool>>(),
        reason: 'should be a failure',
      );

      expect(
        function.count,
        0,
        reason: 'should not be called',
      );
    });
  });
  group('OnResultAsyncX', () {
    final result = nullaryStub<Result<bool>>();
    final function = unaryStub<Future<Result<bool>>, bool>()
      ..stub = (i) async => Success(!i);
    test('GIVEN ... ' 'WHEN is Success' 'THEN function is called', () async {
      function.reset;
      result
        ..reset
        ..stub = () => const Success(true);

      expect(
        await result.wrap().onFutureResult(function.wrap),
        isA<Success>(),
        reason: 'should be a success',
      );

      expect(
        function.count,
        1,
        reason: 'should called once',
      );
    });

    test('GIVEN ... ' 'WHEN is Failure' 'THEN function is called', () async {
      function.reset;
      result
        ..reset
        ..stub = () => Failure();

      expect(
        await result.wrap().onFutureResult(function.wrap),
        isA<Failure<bool>>(),
        reason: 'should be a failure',
      );

      expect(
        function.count,
        0,
        reason: 'should not be called',
      );
    });
  });
}
