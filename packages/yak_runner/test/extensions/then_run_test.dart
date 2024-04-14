import 'dart:async';

import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('ThenRunUnaryX', () {
    final function = Stub.unary<int, int>();

    group('thenRun', () {
      group('Success', () {
        final tester = Stub.nullary<FutureValueResult<int>>()
          ..stub = () => Future.value(ValueSuccess(0));
        setUp(() {
          tester.reset();
          function.reset();
        });

        test(
            'GIVEN Result is Success '
            'WHEN function does not throw '
            'THEN result is Success', () async {
          function.stub = (value) => value + 1;

          await expectLater(
            await tester().thenRun(function.call),
            isA<Success>(),
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

          await expectLater(
            await tester().thenRun(function.call),
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
        final tester = Stub.nullary<FutureValueResult<int>>()
          ..stub = () => Future.value(Failure());

        setUp(() {
          tester.reset();
          function.reset();
        });

        test(
            'GIVEN Result is Failure '
            'WHEN function does not throw '
            'THEN result is Failure', () async {
          function.stub = (value) => value + 1;

          await expectLater(
            await tester().thenRun(function.call),
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

          await expectLater(
            await tester().thenRun(function.call),
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
        final tester = Stub.nullary<FutureValueResult<int>>()
          ..stub = () => Future.value(ValueSuccess(0));

        setUp(() {
          tester.reset();
          function.reset();
        });

        test(
            'GIVEN Result is Success '
            'WHEN function does not throw '
            'THEN result is Success', () async {
          function.stub = (value) => value + 1;

          await expectLater(
            await tester().thenRunVoid(function.call),
            isA<Success>(),
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

          await expectLater(
            await tester().thenRunVoid(function.call),
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
        final tester = Stub.nullary<FutureValueResult<int>>()
          ..stub = () => Future.value(Failure());

        setUp(() {
          tester.reset();
          function.reset();
        });

        test(
            'GIVEN Result is Failure '
            'WHEN function does not throw '
            'THEN result is Failure', () async {
          function.stub = (value) => value + 1;

          await expectLater(
            await tester().thenRunVoid(function.call),
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

          await expectLater(
            await tester().thenRunVoid(function.call),
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
          ..stub = () => Future.value(VoidSuccess());

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

          await expectLater(
            await tester().thenRun(function.call),
            isA<Success>(),
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

          await expectLater(
            await tester().thenRun(function.call),
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
          ..stub = () => Future.value(Failure());
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

          await expectLater(
            await tester().thenRun(function.call),
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

          await expectLater(
            await tester().thenRun(function.call),
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
        final tester = Stub.nullary<FutureVoidResult>()
          ..stub = () => Future.value(VoidSuccess());

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

          await expectLater(
            await tester().thenRunVoid(function.call),
            isA<Success>(),
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

          await expectLater(
            await tester().thenRunVoid(function.call),
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
          ..stub = () => Future.value(Failure());

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

          await expectLater(
            await tester().thenRunVoid(function.call),
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

          await expectLater(
            await tester().thenRunVoid(function.call),
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
