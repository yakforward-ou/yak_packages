import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_result/yak_result.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('ThenRunX', () {
    group('thenRun', () {
      final seed = nullaryStub<Result<int>>();
      final functionStub = unaryStub<bool, int>();
      Unary<bool, int> buildTester() => functionStub.wrap;

      test(
          'GIVEN a Success seed and a RunUnarySync function '
          'WHEN seed.thenRun(function) '
          'THEN return Result based on function (SUCCESS)', () {
        seed
          ..reset
          ..stub = () => Success(1);

        functionStub
          ..reset
          ..stub = (i) => i < 1;

        final function = buildTester();
        final results = seed.wrap().thenRun(function.run);

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
          'GIVEN a Failure seed and a RunUnarySync function '
          'WHEN seed.thenRun(function) '
          'THEN return a Failure', () {
        seed
          ..reset
          ..stub = () => Failure<int>();

        functionStub
          ..reset
          ..stub = (i) => i < 1;

        final function = buildTester();
        final results = seed.wrap().thenRun(function.run);

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
          'GIVEN a Success seed and a RunUnarySync function '
          'WHEN seed.thenRun(function) '
          'THEN return Result based on function (FAILURE)', () {
        seed
          ..reset
          ..stub = () => Success(1);

        functionStub
          ..reset
          ..stub = (i) => throw Exception();

        final function = buildTester();
        final results = seed.wrap().thenRun(function.run);

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
      final seed = nullaryStub<Result<int>>();
      final functionStub = unaryStub<Future<bool>, int>();
      UnaryAsync<bool, int> buildTester() => functionStub.wrap;

      test(
          'GIVEN a Success seed and a RunUnaryAsync function '
          'WHEN seed.thenRun(function) '
          'THEN return Result based on function (SUCCESS)', () async {
        seed
          ..reset
          ..stub = () => Success(1);

        functionStub
          ..reset
          ..stub = (i) => Future.sync(() => i < 1);

        final function = buildTester();
        final results = await seed.wrap().thenRunAsync(function.run);

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
          'GIVEN a Failure seed and a RunUnarySync function '
          'WHEN seed.thenRun(function) '
          'THEN return a Failure', () async {
        seed
          ..reset
          ..stub = () => Failure<int>();

        functionStub
          ..reset
          ..stub = (i) => Future.sync(() => i < 1);

        final function = buildTester();
        final results = await seed.wrap().thenRunAsync(function.run);

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
          'GIVEN a Success seed and a RunUnarySync function '
          'WHEN seed.thenRun(function) '
          'THEN return Result based on function (FAILURE)', () async {
        seed
          ..reset
          ..stub = () => Success(1);

        functionStub
          ..reset
          ..stub = (i) => throw Exception();

        final function = buildTester();
        final results = await seed.wrap().thenRunAsync(function.run);

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
      final seed = nullaryStub<Future<Result<int>>>();
      final functionStub = unaryStub<bool, int>();
      Unary<bool, int> buildTester() => functionStub.wrap;

      test(
          'GIVEN a Future<Success> seed and a RunUnarySync function '
          'WHEN seed.thenRun(function) '
          'THEN return Result based on function (SUCCESS)', () async {
        seed
          ..reset
          ..stub = () => Future.sync(() => Success(1));

        functionStub
          ..reset
          ..stub = (i) => i < 1;

        final function = buildTester();
        final results = await seed.wrap().thenRun(function.run);

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
          'GIVEN a Future Failure seed and a RunUnarySync function '
          'WHEN seed.thenRun(function) '
          'THEN return a Failure', () async {
        seed
          ..reset
          ..stub = () => Future.sync(() => Failure<int>());

        functionStub
          ..reset
          ..stub = (i) => i < 1;

        final function = buildTester();
        final results = await seed.wrap().thenRun(function.run);

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
          'GIVEN a Future Success seed and a RunUnarySync function '
          'WHEN seed.thenRun(function) '
          'THEN return Result based on function (FAILURE)', () async {
        seed
          ..reset
          ..stub = () => Future.sync(() => Success(1));

        functionStub
          ..reset
          ..stub = (i) => throw Exception();

        final function = buildTester();
        final results = await seed.wrap().thenRun(function.run);

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
      final seed = nullaryStub<Result<int>>();
      final functionStub = unaryStub<Future<bool>, int>();
      UnaryAsync<bool, int> buildTester() => functionStub.wrap;

      test(
          'GIVEN a Future Success seed and a RunUnaryAsync function '
          'WHEN seed.thenRun(function) '
          'THEN return Result based on function (SUCCESS)', () async {
        seed
          ..reset
          ..stub = () => Success(1);

        functionStub
          ..reset
          ..stub = (i) => Future.sync(() => i < 1);

        final function = buildTester();
        final results = await seed.wrap().thenRunAsync(function.run);

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
          'GIVEN a Future Failure seed and a RunUnarySync function '
          'WHEN seed.thenRun(function) '
          'THEN return a Failure', () async {
        seed
          ..reset
          ..stub = () => Failure<int>();

        functionStub
          ..reset
          ..stub = (i) => Future.sync(() => i < 1);

        final function = buildTester();
        final results = await seed.wrap().thenRunAsync(function.run);

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
          'GIVEN a Future Success seed and a RunUnarySync function '
          'WHEN seed.thenRun(function) '
          'THEN return Result based on function (FAILURE)', () async {
        seed
          ..reset
          ..stub = () => Success(1);

        functionStub
          ..reset
          ..stub = (i) => throw Exception();

        final function = buildTester();
        final results = await seed.wrap().thenRunAsync(function.run);

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
