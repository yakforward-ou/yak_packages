import 'dart:async';

import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('ValueResultLetRunX', () {
    final tester = Stub.nullary<ValueResult<int>>();
    final function = Stub.unary<int, int>();
    group('on Success', () {
      setUp(() {
        tester.reset();
        function.reset();
      });
      test(
          'GIVEN Result is Success '
          'WHEN function does not throw '
          'THEN result is Success', () {
        tester.stub = () => ValueSuccess(0);
        function.stub = (value) => value + 1;

        expect(
          tester().letRun(function),
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
          'THEN result is Failure', () {
        tester.stub = () => ValueSuccess(0);
        function.stub = (_) => throw Exception();

        expect(
          tester().letRun(function),
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
    group('on Failure', () {
      setUp(() {
        tester.reset();
        function.reset();
      });
      test(
          'GIVEN Result is Failure '
          'WHEN function returns Success '
          'THEN result is Failure', () {
        tester.stub = () => Failure();
        function.stub = (value) => value + 1;

        expect(
          tester().letRun(function),
          isA<Failure>(),
          reason: 'should return a Failure',
        );

        expect(
          function.count,
          equals(0),
          reason: 'function should NOT be called',
        );
      });
      test(
          'GIVEN Result is Failure '
          'WHEN function returns Failure '
          'THEN result is Failure', () {
        tester.stub = () => Failure();
        function.stub = (_) => throw Exception();

        expect(
          tester().letRun(function),
          isA<Failure>(),
          reason: 'should return a Failure',
        );

        expect(
          function.count,
          equals(0),
          reason: 'function should NOT be called',
        );
      });
    });
  });
  group('ValueResultThenRunX', () {
    final tester = Stub.nullary<ValueResult<int>>();
    final function = Stub.unary<FutureOr<int>, int>();
    group('on Success', () {
      setUp(() {
        tester.reset();
        function.reset();
      });
      test(
          'GIVEN Result is Success '
          'WHEN function returns Success '
          'THEN result is Success', () async {
        tester.stub = () => ValueSuccess(0);
        function.stub = (value) => Future.sync(() => value + 1);

        expect(
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
          'WHEN function returns Failure '
          'THEN result is Success', () async {
        tester.stub = () => ValueSuccess(0);
        function.stub = (_) => Future.sync(() => throw Exception());

        expect(
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
    group('on Failure', () {
      setUp(() {
        tester.reset();
        function.reset();
      });
      test(
          'GIVEN Result is Failure '
          'WHEN function returns Success '
          'THEN result is Failure', () async {
        tester.stub = () => Failure();
        function.stub = (value) => Future.sync(() => value + 1);

        expect(
          await tester().thenRun(function),
          isA<Failure>(),
          reason: 'should return a Failure',
        );

        expect(
          function.count,
          equals(0),
          reason: 'function should NOT be called',
        );
      });
      test(
          'GIVEN Result is Failure '
          'WHEN function returns Failure '
          'THEN result is Failure', () async {
        tester.stub = () => Failure();
        function.stub = (_) => Future.sync(() => throw Exception());

        expect(
          await tester().thenRun(function),
          isA<Failure>(),
          reason: 'should return a Failure',
        );

        expect(
          function.count,
          equals(0),
          reason: 'function should NOT be called',
        );
      });
    });
  });
  group('VoidResultLetRunX', () {
    final tester = Stub.nullary<VoidResult>();
    final function = Stub.nullary<int>();
    group('on Success', () {
      setUp(() {
        tester.reset();
        function.reset();
      });
      test(
          'GIVEN Result is Success '
          'WHEN function does not throw '
          'THEN result is Success', () {
        tester.stub = () => const VoidSuccess();
        function.stub = () => 0;

        expect(
          tester().letRun(function),
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
          'THEN result is Failure', () {
        tester.stub = () => const VoidSuccess();
        function.stub = () => throw Exception();

        expect(
          tester().letRun(function),
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
    group('on Failure', () {
      setUp(() {
        tester.reset();
        function.reset();
      });
      test(
          'GIVEN Result is Failure '
          'WHEN function returns Success '
          'THEN result is Failure', () {
        tester.stub = () => Failure();
        function.stub = () => 0;

        expect(
          tester().letRun(function),
          isA<Failure>(),
          reason: 'should return a Failure',
        );

        expect(
          function.count,
          equals(0),
          reason: 'function should NOT be called',
        );
      });
      test(
          'GIVEN Result is Failure '
          'WHEN function returns Failure '
          'THEN result is Failure', () {
        tester.stub = () => Failure();
        function.stub = () => throw Exception();

        expect(
          tester().letRun(function),
          isA<Failure>(),
          reason: 'should return a Failure',
        );

        expect(
          function.count,
          equals(0),
          reason: 'function should NOT be called',
        );
      });
    });
  });
  group('VoidResultThenRunX', () {
    final tester = Stub.nullary<VoidResult>();
    final function = Stub.nullary<FutureOr<int>>();
    group('on Success', () {
      setUp(() {
        tester.reset();
        function.reset();
      });
      test(
          'GIVEN Result is Success '
          'WHEN function returns Success '
          'THEN result is Success', () async {
        tester.stub = () => const VoidSuccess();
        function.stub = () => Future.sync(() => 0);

        expect(
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
          'WHEN function returns Failure '
          'THEN result is Success', () async {
        tester.stub = () => const VoidSuccess();
        function.stub = () => Future.sync(() => throw Exception());

        expect(
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
    group('on Failure', () {
      setUp(() {
        tester.reset();
        function.reset();
      });
      test(
          'GIVEN Result is Failure '
          'WHEN function returns Success '
          'THEN result is Failure', () async {
        tester.stub = () => Failure();
        function.stub = () => Future.sync(() => 0);

        expect(
          await tester().thenRun(function),
          isA<Failure>(),
          reason: 'should return a Failure',
        );

        expect(
          function.count,
          equals(0),
          reason: 'function should NOT be called',
        );
      });
      test(
          'GIVEN Result is Failure '
          'WHEN function returns Failure '
          'THEN result is Failure', () async {
        tester.stub = () => Failure();
        function.stub = () => Future.sync(() => throw Exception());

        expect(
          await tester().thenRun(function),
          isA<Failure>(),
          reason: 'should return a Failure',
        );

        expect(
          function.count,
          equals(0),
          reason: 'function should NOT be called',
        );
      });
    });
  });
}
