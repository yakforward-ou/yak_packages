import 'dart:async';

import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('ThenRunUnaryX', () {
    final function = Stub.unary<int, int>();

    group('thenRun', () {
      group('Success', () {
        final tester = Stub.nullary<FutureResult<int>>()
          ..stub = () => Future.value(const Result.success(0));
        setUp(() {
          tester.reset();
          function.reset();
        });

        test(
            'GIVEN Result is Success '
            'WHEN function does not throw '
            'THEN result is Success', () async {
          function.stub = (value) => value + 1;
          final result = await tester().thenRun(function.call);

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
            'THEN result is Failure', () async {
          function.stub = (_) => throw Exception();

          final result = await tester().thenRun(function.call);
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

      group('Failure', () {
        final tester = Stub.nullary<FutureResult<int>>()
          ..stub = () => Future.value(Result.failure());

        setUp(() {
          tester.reset();
          function.reset();
        });

        test(
            'GIVEN Result is Failure '
            'WHEN function does not throw '
            'THEN result is Failure', () async {
          function.stub = (value) => value + 1;

          final result = await tester().thenRun(function.call);
          expect(
            result,
            isA<Failure>(),
            reason: 'should return a Success',
          );

          expect(
            result.isFailure,
            isTrue,
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
            'THEN result is Failure', () async {
          function.stub = (_) => throw Exception();

          final result = await tester().thenRun(function.call);
          expect(
            result,
            isA<Failure>(),
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
        final tester = Stub.nullary<FutureResult<int>>()
          ..stub = () => Future.value(const Result.success(0));

        setUp(() {
          tester.reset();
          function.reset();
        });

        test(
            'GIVEN Result is Success '
            'WHEN function does not throw '
            'THEN result is Success', () async {
          function.stub = (value) => value + 1;

          final result = await tester().thenRunVoid(function.call);

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
            'THEN result is Failure', () async {
          function.stub = (_) => throw Exception();

          final result = await tester().thenRunVoid(function.call);
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
      group('Failure', () {
        final tester = Stub.nullary<FutureResult<int>>()
          ..stub = () => Future.value(Result.failure());

        setUp(() {
          tester.reset();
          function.reset();
        });

        test(
            'GIVEN Result is Failure '
            'WHEN function does not throw '
            'THEN result is Failure', () async {
          function.stub = (value) => value + 1;

          final result = await tester().thenRunVoid(function.call);
          expect(
            result,
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
            'THEN result is Failure', () async {
          function.stub = (_) => throw Exception();

          final result = await tester().thenRunVoid(function.call);
          expect(
            result,
            isA<Failure>(),
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
  });

  group('ThenRunNullaryX', () {
    group('thenRun', () {
      group('Success', () {
        final tester = Stub.nullary<FutureVoidResult>()
          ..stub = () => Future.value(VoidResult.success());

        final function = Stub.nullary<int>();

        setUp(() {
          tester.reset();
          function.reset();
        });

        test(
            'GIVEN Result is Success '
            'WHEN function does not throw '
            'THEN result is Success', () async {
          function.stub = () => 0;

          final result = await tester().thenRun(function.call);

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
            'THEN result is Failure', () async {
          function.stub = () => throw Exception();

          final result = await tester().thenRun(function.call);
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

      group('Failure', () {
        final tester = Stub.nullary<FutureVoidResult>()
          ..stub = () => Future.value(const VoidResult.failure());
        final function = Stub.nullary<int>();

        setUp(() {
          tester.reset();
          function.reset();
        });

        test(
            'GIVEN Result is Failure '
            'WHEN function does not throw '
            'THEN result is Failure', () async {
          function.stub = () => 0;

          final result = await tester().thenRun(function.call);
          expect(
            result,
            isA<Failure>(),
            reason: 'should return a Success',
          );

          expect(
            result.isFailure,
            isTrue,
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
            'THEN result is Failure', () async {
          function.stub = () => throw Exception();

          final result = await tester().thenRun(function.call);
          expect(
            result,
            isA<Failure>(),
            reason: 'should return a Failure',
          );

          expect(
            result.isFailure,
            isTrue,
            reason: 'should return a Success',
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
        final tester = Stub.nullary<FutureVoidResult>()
          ..stub = () => Future.value(VoidResult.success());

        final function = Stub.nullary<int>();

        setUp(() {
          tester.reset();
          function.reset();
        });

        test(
            'GIVEN Result is Success '
            'WHEN function does not throw '
            'THEN result is Success', () async {
          function.stub = () => 0;
          final result = await tester().thenRunVoid(function.call);

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
            'THEN result is Failure', () async {
          function.stub = () => throw Exception();

          final result = await tester().thenRunVoid(function.call);
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
      group('Failure', () {
        final tester = Stub.nullary<FutureVoidResult>()
          ..stub = () => Future.value(const VoidResult.failure());

        final function = Stub.nullary<int>();

        setUp(() {
          tester.reset();
          function.reset();
        });

        test(
            'GIVEN Result is Failure '
            'WHEN function does not throw '
            'THEN result is Failure', () async {
          function.stub = () => 0;

          final result = await tester().thenRunVoid(function.call);
          expect(
            result,
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
            'THEN result is Failure', () async {
          function.stub = () => throw Exception();

          final result = await tester().thenRunVoid(function.call);
          expect(
            result,
            isA<Failure>(),
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
  });
}
