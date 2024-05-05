import 'dart:async';

import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('RunBypassX', () {
    final function = Stub.unary<int, int>();

    group('Success', () {
      const seed = 0;
      final tester = Stub.nullary<Result<int>>()
        ..stub = () => const Result.success(seed);
      setUp(() {
        tester.reset();
        function.reset();
      });

      test(
          'GIVEN Result is Success '
          'WHEN function does not throw '
          'THEN result is Success', () async {
        function.stub = (value) => value + 1;
        final result = tester().runBypass(function.call);

        expect(
          result.isSuccess,
          isTrue,
          reason: 'should return a Success',
        );

        expect(
          result.asSuccess,
          equals(seed),
          reason: 'seed should not change',
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
        function.stub = (value) => throw Exception();
        final result = tester().runBypass(function.call);

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

    group('Failure', () {
      final tester = Stub.nullary<Result<int>>()..stub = () => Result.failure();
      setUp(() {
        tester.reset();
        function.reset();
      });

      test(
          'GIVEN Result is Failure '
          'WHEN anyhow'
          'THEN result is Failure', () async {
        function.stub = (value) => value + 1;
        final result = tester().runBypass(function.call);

        expect(
          result.isFailure,
          isTrue,
          reason: 'should return a Failure',
        );

        expect(
          function.count,
          equals(0),
          reason: 'function should not be called',
        );
      });
    });
  });

  group('RunBypassAsyncX', () {
    final function = Stub.unary<Future<int>, int>();

    group('Success', () {
      const seed = 0;
      final tester = Stub.nullary<FutureResult<int>>()
        ..stub = () async => const Result.success(seed);
      setUp(() {
        tester.reset();
        function.reset();
      });

      test(
          'GIVEN Result is Success '
          'WHEN function does not throw '
          'THEN result is Success', () async {
        function.stub = (value) async => value + 1;
        final result = await tester().runBypassAsync(function.call);

        expect(
          result.isSuccess,
          isTrue,
          reason: 'should return a Success',
        );

        expect(
          result.asSuccess,
          equals(seed),
          reason: 'seed should not change',
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
        function.stub = (value) async => throw Exception();
        final result = await tester().runBypassAsync(function.call);
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

    group('Failure', () {
      final tester = Stub.nullary<FutureResult<int>>()
        ..stub = () async => Result.failure();
      setUp(() {
        tester.reset();
        function.reset();
      });

      test(
          'GIVEN Result is Failure '
          'WHEN anyhow'
          'THEN result is Failure', () async {
        function.stub = (value) async => value + 1;
        final result = await tester().runBypassAsync(function.call);

        expect(
          result.isFailure,
          isTrue,
          reason: 'should return a Failure',
        );

        expect(
          function.count,
          equals(0),
          reason: 'function should not be called',
        );
      });
    });
  });
}
