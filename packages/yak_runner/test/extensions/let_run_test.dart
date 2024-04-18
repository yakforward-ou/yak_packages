import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('ResultLetRunX', () {
    group('letRun', () {
      group('Success', () {
        final tester = Stub.nullary<Result<int>>()
          ..stub = () => Result.success(0);
        final function = Stub.unary<int, int>();

        setUp(() {
          tester.reset();
          function.reset();
        });

        test(
            'GIVEN Result is Success '
            'WHEN function does not throw '
            'THEN result is Success', () {
          function.stub = (value) => value + 1;
          final result = tester().letRun(function.call);

          expect(
            result,
            isA<Result<int>>(),
            reason: 'should return a Success',
          );

          expect(
            result.isSuccess,
            isTrue,
            reason: 'should return a Success',
          );

          expect(
            function.count,
            equals(1),
            reason: 'function should be called once',
          );
        });

        test(
            'GIVEN Result is Success '
            'WHEN function throws '
            'THEN result is Failure', () {
          function.stub = (_) => throw Exception();
          final result = tester().letRun(function.call);

          expect(
            result.isFailure,
            isTrue,
            reason: 'should return a Failure',
          );

          expect(
            result,
            isA<Failure>(),
            reason: 'should return a Failure',
          );

          expect(
            result,
            isA<Result>(),
            reason: 'should return a Failure',
          );

          expect(
            function.count,
            equals(1),
            reason: 'function should be called once',
          );
        });
      });

      group('Failure', () {
        final tester = Stub.nullary<Result<int>>()
          ..stub = () => Result.failure();
        final function = Stub.unary<int, int>();

        setUp(() {
          tester.reset();
          function.reset();
        });

        test(
            'GIVEN Result is Failure '
            'WHEN function does not throw '
            'THEN result is Failure', () {
          function.stub = (value) => value + 1;

          expect(
            tester().letRun(function.call),
            isA<Failure>(),
            reason: 'should return a Success',
          );

          expect(
            function.count,
            equals(0),
            reason: 'function should be not be called',
          );
        });

        test(
            'GIVEN Result is Failure '
            'WHEN function does not throw '
            'THEN result is Result', () {
          function.stub = (value) => value + 1;

          expect(
            tester().letRun(function.call),
            isA<Failure>(),
            reason: 'should return a Success',
          );

          expect(
            function.count,
            equals(0),
            reason: 'function should be not be called',
          );
        });

        test(
            'GIVEN Result is Failure '
            'WHEN function does not throw '
            'THEN result is Result', () {
          function.stub = (value) => value + 1;

          expect(
            tester().letRun(function.call),
            isA<Failure>(),
            reason: 'should return a Success',
          );

          expect(
            function.count,
            equals(0),
            reason: 'function should be not be called',
          );
        });

        test(
            'GIVEN Result is Failure '
            'WHEN function throws '
            'THEN result is Failure', () {
          function.stub = (_) => throw Exception();
          final result = tester().letRun(function.call);
          expect(
            result,
            isA<Failure>(),
            reason: 'should return a Failure',
          );

          expect(
            result.isFailure,
            isTrue,
            reason: 'should return a Failure',
          );

          expect(
            function.count,
            equals(0),
            reason: 'function should be not be called',
          );
        });
      });
    });

    group('thenRunVoid', () {
      group('Success', () {
        final tester = Stub.nullary<Result<int>>()
          ..stub = () => Result.success(0);
        final function = Stub.unary<int, int>();

        setUp(() {
          tester.reset();
          function.reset();
        });

        test(
            'GIVEN Result is Success '
            'WHEN function does not throw '
            'THEN result is Success', () {
          function.stub = (value) => value + 1;
          final result = tester().letRunVoid(function.call);
          expect(
            result.isSuccess,
            isTrue,
            reason: 'should return a Success',
          );

          expect(
            result,
            isA<VoidResult>(),
            reason: 'should return a Success',
          );

          expect(
            function.count,
            equals(1),
            reason: 'function should be called once',
          );
        });

        test(
            'GIVEN Result is Success '
            'WHEN function throws '
            'THEN result is Failure', () {
          function.stub = (_) => throw Exception();

          final result = tester().letRunVoid(function.call);
          expect(
            result.isFailure,
            isTrue,
            reason: 'should return a Failure',
          );

          expect(
            result,
            isA<Failure>(),
            reason: 'should return a Failure',
          );

          expect(
            function.count,
            equals(1),
            reason: 'function should be called once',
          );
        });
      });
    });
  });

  group('ThenRunNullaryX', () {
    final tester = Stub.nullary<VoidResult>();
    final function = Stub.nullary<int>();

    group('thenRun', () {
      group('Success', () {
        tester.stub = () => VoidResult.success();

        setUp(() {
          tester.reset();
          function.reset();
        });

        test(
            'GIVEN Result is Success '
            'WHEN function does not throw '
            'THEN result is Success', () {
          function.stub = () => 0;
          final result = tester().letRun(function.call);
          expect(
            result.isSuccess,
            isTrue,
            reason: 'should return a Success',
          );

          expect(
            result,
            isA<int>(),
            reason: 'should return a Success',
          );

          expect(
            function.count,
            equals(1),
            reason: 'function should be called once',
          );
        });

        test(
            'GIVEN Result is Success '
            'WHEN function throws '
            'THEN result is Failure', () {
          function.stub = () => throw Exception();

          expect(
            tester().letRun(function.call),
            isA<Failure>(),
            reason: 'should return a Failure',
          );

          expect(
            function.count,
            equals(1),
            reason: 'function should be called once',
          );
        });
      });
    });

    group('thenRunVoid', () {
      group('Success', () {
        tester.stub = () => const VoidResult.success();

        setUp(() {
          tester.reset();
          function.reset();
        });

        test(
            'GIVEN Result is Success '
            'WHEN function does not throw '
            'THEN result is Success', () {
          function.stub = () => 0;

          expect(
            tester().letRunVoid(function.call).isSuccess,
            isTrue,
            reason: 'should return a Success',
          );

          expect(
            function.count,
            equals(1),
            reason: 'function should be called once',
          );
        });

        test(
            'GIVEN Result is Success '
            'WHEN function throws '
            'THEN result is Failure', () {
          function.stub = () => throw Exception();
          final result = tester().letRunVoid(function.call);
          expect(
            result,
            isA<Failure>(),
            reason: 'should return a Failure',
          );

          expect(
            result.isFailure,
            isTrue,
            reason: 'should return a Failure',
          );

          expect(
            function.count,
            equals(1),
            reason: 'function should be called once',
          );
        });
      });
    });
  });
}
