import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_result/yak_result.dart';

void main() {
  group('OnResultX', () {
    test('GIVEN ... ' 'WHEN is Success' 'THEN function is called', () {
      final result = Stub.nullary<Result<bool>>()
        ..stub = () => const Success(true);

      final function = Stub.unary<Result<bool>, bool>()
        ..stub = (i) => Success(!i);

      expect(
        result().onResult(function),
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
      final result = Stub.nullary<Result<bool>>()..stub = () => Failure();

      final function = Stub.unary<Result<bool>, bool>()
        ..stub = (i) => Success(!i);

      expect(
        result().onResult<bool>(function),
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
    test('GIVEN ... ' 'WHEN is Success' 'THEN function is called', () async {
      final result = Stub.nullary<Result<bool>>()
        ..stub = () => const Success(true);

      final function = Stub.unary<Future<Result<bool>>, bool>()
        ..stub = (i) async => Success(!i);

      expect(
        await result().onResultAsync(function),
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
      final result = Stub.nullary<Result<bool>>()..stub = () => Failure();

      final function = Stub.unary<Future<Result<bool>>, bool>()
        ..stub = (i) async => Success(!i);

      expect(
        await result().onResultAsync<bool>(function),
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
