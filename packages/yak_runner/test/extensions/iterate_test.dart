import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('IterableRunX', () {
    group('iterateRun', () {
      test(
          'GIVEN Iterable of S and  RunUnarySync<T, S> '
          'WHEN iterateRun '
          'THEN return Iterable<Result<T>>', () {
        bool tester(int i) {
          if (i == 0) {
            throw Exception();
          }
          return i % 2 == 0;
        }

        final list = [for (var i = 0; i < 10; ++i) i];

        final results = list.iterateRun(tester.run);

        expect(
          results,
          isA<Iterable<Result<bool>>>(),
          reason: 'iterateRun return type should be predictable',
        );
        expect(
          results.length == list.length,
          isTrue,
          reason: 'iterateRun should output an Iterable of the same lenght',
        );

        final failures = [
          for (final result in results)
            if (result is Failure) result.failure
        ];
        expect(
          failures.length == 1,
          isTrue,
          reason: 'should contain a failure',
        );
      });
    });
    group('iterateRunAsync', () {
      test(
          'GIVEN Iterable of S and RunUnaryAsync<T, S> '
          'WHEN iterateRunAsync '
          'THEN return Stream<Result<T>>', () async {
        Future<bool> tester(int i) async {
          if (i == 0) {
            throw Exception();
          }
          return i % 2 == 0;
        }

        final list = [for (var i = 0; i < 10; ++i) i];

        final results = await list.iterateRunAsync(tester.run).toList();

        expect(
          results,
          isA<Iterable<Result<bool>>>(),
          reason: 'iterateRun return type should be predictable',
        );
        expect(
          results.length == list.length,
          isTrue,
          reason: 'iterateRun should output an Iterable of the same lenght',
        );

        final failures = [
          for (final result in results)
            if (result is Failure) result.failure
        ];

        expect(
          failures.length == 1,
          isTrue,
          reason: 'should contain a failure',
        );
      });
    });
    group('StreamRunX', () {
      group('transformRun', () {
        test(
            'GIVEN Stream of S and RunUnarySync<T, S> '
            'WHEN transformRun '
            'THEN return Stream<Result<T>>', () async {
          bool tester(int i) {
            if (i == 0) {
              throw Exception();
            }
            return i % 2 == 0;
          }

          final list = [for (var i = 0; i < 10; ++i) i];

          final stream = Stream.fromIterable(list);

          final results = stream.transformRun(tester.run);

          expect(
            results,
            isA<Stream<Result<bool>>>(),
            reason: 'iterateRun return type should be predictable',
          );

          final resultSync = await results.toList();
          expect(
            resultSync.length == list.length,
            isTrue,
            reason: 'iterateRun should output an Iterable of the same lenght',
          );

          final failures = [
            for (final result in resultSync)
              if (result is Failure) result.failure
          ];

          expect(
            failures.length == 1,
            isTrue,
            reason: 'should contain a failure',
          );
        });
      });
      group('iterateRunAsync', () {
        test(
            'GIVEN Iterable of S and RunUnaryAsync<T, S> '
            'WHEN iterateRunAsync '
            'THEN return Stream<Result<T>>', () async {
          Future<bool> tester(int i) async {
            if (i == 0) {
              throw Exception();
            }
            return i % 2 == 0;
          }

          final list = [for (var i = 0; i < 10; ++i) i];

          final stream = Stream.fromIterable(list);

          final results = stream.transformRunAsync(tester.run);

          expect(
            results,
            isA<Stream<Result<bool>>>(),
            reason: 'iterateRun return type should be predictable',
          );

          final resultSync = await results.toList();
          expect(
            resultSync.length == list.length,
            isTrue,
            reason: 'iterateRun should output an Iterable of the same lenght',
          );

          final failures = [
            for (final result in resultSync)
              if (result is Failure) result.failure
          ];

          expect(
            failures.length == 1,
            isTrue,
            reason: 'should contain a failure',
          );
        });
      });
    });
  });
}
