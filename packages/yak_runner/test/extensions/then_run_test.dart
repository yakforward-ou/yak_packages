import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('ThenRunX', () {
    group('thenRun', () {
      final seed = Stub.nullary<Result<int>>();
      final function = Stub.unary<bool, int>();

      test(
          'GIVEN a Success seed and a ResultUnary function '
          'WHEN seed.thenRun(function) '
          'THEN return Result based on function (SUCCESS)', () {
        seed
          ..reset()
          ..stub = () => Success(1);

        function
          ..reset()
          ..stub = (i) => i < 1;

        final results = seed().thenRun(function.run);

        expect(
          results,
          isA<Result<bool>>(),
          reason: 'thenRun return type should be predictable',
        );

        expect(
          results,
          isA<Success<bool>>(),
          reason: 'thenRun result should depend from function',
        );
      });

      test(
          'GIVEN a Failure seed and a ResultUnary function '
          'WHEN seed.thenRun(function) '
          'THEN return a Failure', () {
        seed
          ..reset()
          ..stub = () => Failure<int>();

        function
          ..reset()
          ..stub = (i) => i < 1;

        final results = seed().thenRun(function.run);

        expect(
          results,
          isA<Result<bool>>(),
          reason: 'thenRun return type should be predictable',
        );

        expect(
          results,
          isA<Failure<bool>>(),
          reason: 'thenRun result always be a Failure',
        );
      });
      test(
          'GIVEN a Success seed and a ResultUnary function '
          'WHEN seed.thenRun(function) '
          'THEN return Result based on function (FAILURE)', () {
        seed
          ..reset()
          ..stub = () => Success(1);

        function
          ..reset()
          ..stub = (i) => throw Exception();

        final results = seed().thenRun(function.run);

        expect(
          results,
          isA<Result<bool>>(),
          reason: 'thenRun return type should be predictable',
        );

        expect(
          results,
          isA<Failure<bool>>(),
          reason: 'thenRun result should depend from function',
        );
      });
    });
    group('thenRunAsync', () {
      final seed = Stub.nullary<Result<int>>();
      final function = Stub.unary<Future<bool>, int>();

      test(
          'GIVEN a Success seed and a ResultUnaryAsync function '
          'WHEN seed.thenRun(function) '
          'THEN return Result based on function (SUCCESS)', () async {
        seed
          ..reset()
          ..stub = () => Success(1);

        function
          ..reset()
          ..stub = (i) => Future.sync(() => i < 1);

        final results = await seed().thenRunAsync(function.run);

        expect(
          results,
          isA<Result<bool>>(),
          reason: 'thenRun return type should be predictable',
        );

        expect(
          results,
          isA<Success<bool>>(),
          reason: 'thenRun result should depend from function',
        );
      });

      test(
          'GIVEN a Failure seed and a ResultUnary function '
          'WHEN seed.thenRun(function) '
          'THEN return a Failure', () async {
        seed
          ..reset()
          ..stub = () => Failure<int>();

        function
          ..reset()
          ..stub = (i) => Future.sync(() => i < 1);

        final results = await seed().thenRunAsync(function.run);

        expect(
          results,
          isA<Result<bool>>(),
          reason: 'thenRun return type should be predictable',
        );

        expect(
          results,
          isA<Failure<bool>>(),
          reason: 'thenRun result always be a Failure',
        );
      });
      test(
          'GIVEN a Success seed and a ResultUnary function '
          'WHEN seed.thenRun(function) '
          'THEN return Result based on function (FAILURE)', () async {
        seed
          ..reset()
          ..stub = () => Success(1);

        function
          ..reset()
          ..stub = (i) => throw Exception();

        final results = await seed().thenRunAsync(function.run);

        expect(
          results,
          isA<Result<bool>>(),
          reason: 'thenRun return type should be predictable',
        );

        expect(
          results,
          isA<Failure<bool>>(),
          reason: 'thenRun result should depend from function',
        );
      });
    });
  });
  group('ThenRunAsyncX', () {
    group('thenRun', () {
      final seed = Stub.nullary<Future<Result<int>>>();
      final function = Stub.unary<bool, int>();

      test(
          'GIVEN a Future<Success> seed and a ResultUnary function '
          'WHEN seed.thenRun(function) '
          'THEN return Result based on function (SUCCESS)', () async {
        seed
          ..reset()
          ..stub = () => Future.sync(() => Success(1));

        function
          ..reset()
          ..stub = (i) => i < 1;

        final results = await seed().thenRun(function.run);

        expect(
          results,
          isA<Result<bool>>(),
          reason: 'thenRun return type should be predictable',
        );

        expect(
          results,
          isA<Success<bool>>(),
          reason: 'thenRun result should depend from function',
        );
      });

      test(
          'GIVEN a Future Failure seed and a ResultUnary function '
          'WHEN seed.thenRun(function) '
          'THEN return a Failure', () async {
        seed
          ..reset()
          ..stub = () => Future.sync(() => Failure<int>());

        function
          ..reset()
          ..stub = (i) => i < 1;

        final results = await seed().thenRun(function.run);

        expect(
          results,
          isA<Result<bool>>(),
          reason: 'thenRun return type should be predictable',
        );

        expect(
          results,
          isA<Failure<bool>>(),
          reason: 'thenRun result always be a Failure',
        );
      });
      test(
          'GIVEN a Future Success seed and a ResultUnary function '
          'WHEN seed.thenRun(function) '
          'THEN return Result based on function (FAILURE)', () async {
        seed
          ..reset()
          ..stub = () => Future.sync(() => Success(1));

        function
          ..reset()
          ..stub = (i) => throw Exception();

        final results = await seed().thenRun(function.run);

        expect(
          results,
          isA<Result<bool>>(),
          reason: 'thenRun return type should be predictable',
        );

        expect(
          results,
          isA<Failure<bool>>(),
          reason: 'thenRun result should depend from function',
        );
      });
    });
    group('thenRunAsync', () {
      final seed = Stub.nullary<Result<int>>();
      final function = Stub.unary<Future<bool>, int>();

      test(
          'GIVEN a Future Success seed and a ResultUnaryAsync function '
          'WHEN seed.thenRun(function) '
          'THEN return Result based on function (SUCCESS)', () async {
        seed
          ..reset()
          ..stub = () => Success(1);

        function
          ..reset()
          ..stub = (i) => Future.sync(() => i < 1);

        final results = await seed().thenRunAsync(function.run);

        expect(
          results,
          isA<Result<bool>>(),
          reason: 'thenRun return type should be predictable',
        );

        expect(
          results,
          isA<Success<bool>>(),
          reason: 'thenRun result should depend from function',
        );
      });

      test(
          'GIVEN a Future Failure seed and a ResultUnary function '
          'WHEN seed.thenRun(function) '
          'THEN return a Failure', () async {
        seed
          ..reset()
          ..stub = () => Failure<int>();

        function
          ..reset()
          ..stub = (i) => Future.sync(() => i < 1);

        final results = await seed().thenRunAsync(function.run);

        expect(
          results,
          isA<Result<bool>>(),
          reason: 'thenRun return type should be predictable',
        );

        expect(
          results,
          isA<Failure<bool>>(),
          reason: 'thenRun result always be a Failure',
        );
      });
      test(
          'GIVEN a Future Success seed and a ResultUnary function '
          'WHEN seed.thenRun(function) '
          'THEN return Result based on function (FAILURE)', () async {
        seed
          ..reset()
          ..stub = () => Success(1);

        function
          ..reset()
          ..stub = (i) => throw Exception();

        final results = await seed().thenRunAsync(function.run);

        expect(
          results,
          isA<Result<bool>>(),
          reason: 'thenRun return type should be predictable',
        );

        expect(
          results,
          isA<Failure<bool>>(),
          reason: 'thenRun result should depend from function',
        );
      });
    });
  });
}
