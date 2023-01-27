import 'dart:async';

import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('ThenRunUnaryX', () {
    final function = Stub.unary<int, int>();
    final tester = Stub.nullary<FutureValueResult<int>>();
    group('thenRun', () {
      group('Success', () {
        tester.stub = () => Future.value(ValueSuccess(0));

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
            await tester().thenRun(function),
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
            await tester().thenRun(function),
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
        tester.stub = () => Future.value(Failure());

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
            await tester().thenRun(function),
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
            await tester().thenRun(function),
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
        tester.stub = () => Future.value(ValueSuccess(0));

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
            await tester().thenRunVoid(function),
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
            await tester().thenRunVoid(function),
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
        tester.stub = () => Future.value(Failure());

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
            await tester().thenRunVoid(function),
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
            await tester().thenRunVoid(function),
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
    final tester = Stub.nullary<FutureVoidResult>();
    final function = Stub.nullary<int>();

    group('thenRun', () {
      group('Success', () {
        tester.stub = () => Future.value(VoidSuccess());

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
            await tester().thenRun(function),
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
            await tester().thenRun(function),
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
        tester.stub = () => Future.value(Failure());

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
            await tester().thenRun(function),
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
            await tester().thenRun(function),
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
        tester.stub = () => Future.value(VoidSuccess());

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
            await tester().thenRunVoid(function),
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
            await tester().thenRunVoid(function),
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
        tester.stub = () => Future.value(Failure());

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
            await tester().thenRunVoid(function),
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
            await tester().thenRunVoid(function),
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
