import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  const times = 10;
  final iterable = [for (var i = 0; i < times; ++i) i];

  group('ForEachRunX', () {
    group('forEachRun', () {
      final tester = Stub.unary<bool, int>();

      setUp(tester.reset);
      test(
          'GIVEN Iterable of S and ResultUnary<T, S> '
          'WHEN forEachRun '
          'THEN return Iterable<Result<T>>', () {
        tester.stub = (i) => i.isEven ? i.isEven : throw Exception();

        final results = iterable.forEachRun<bool>(tester);

        expect(
          results,
          isA<Iterable<Result<bool>>>(),
          reason: 'forEachRun return type should be predictable',
        );
        expect(
          results.length,
          equals(times),
          reason: 'result lenght should be predictable',
        );
        expect(
          tester.count,
          equals(times),
          reason: 'tester should be called $times times',
        );
      });
    });
    group('forEachRunAsync', () {
      final tester = Stub.unary<Future<bool>, int>();

      setUp(tester.reset);
      test(
          'GIVEN Iterable of S and ResultUnary<T, S> '
          'WHEN forEachRunAsync '
          'THEN return Stream<Result<T>>', () async {
        tester.stub = (i) => Future.sync(
              () => i.isEven ? i.isEven : throw Exception(),
            );

        final results = await iterable.forEachRunAsync<bool>(tester).toList();

        expect(
          results,
          isA<Iterable<Result<bool>>>(),
          reason: 'forEachRun return type should be predictable',
        );
        expect(
          results.length,
          equals(times),
          reason: 'result lenght should be predictable',
        );
        expect(
          tester.count,
          equals(times),
          reason: 'tester should be called $times times',
        );
      });
    });
  });
  group('StreamRunX', () {
    final stream = Stream.fromIterable(iterable);

    group('forEachRunAsync', () {
      final tester = Stub.unary<Future<bool>, int>();

      setUp(tester.reset);
      test(
          'GIVEN Iterable of S and ResultUnary<T, S> '
          'WHEN forEachRun '
          'THEN return Iterable<Result<T>>', () async {
        tester.stub = (i) => Future.sync(
              () => i.isEven ? i.isEven : throw Exception(),
            );

        final results = await stream.forEachRun<bool>(tester).toList();

        expect(
          results,
          isA<Iterable<Result<bool>>>(),
          reason: 'forEachRun return type should be predictable',
        );
        expect(
          results.length,
          equals(times),
          reason: 'result lenght should be predictable',
        );
        expect(
          tester.count,
          equals(times),
          reason: 'tester should be called $times times',
        );
      });
    });
  });
}
