import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('IterableNullaryToResultNullaryX', () {
    group('run', () {
      final tester = Stub.nullary<List<Nullary<int>>>()..stub = () => [];

      setUp(tester.reset);

      test(
          'GIVEN a tester List<Nullary<int> '
          'WHEN tester.call.run '
          'THEN returns a Iterable<ResultNullary<int>>', () {
        expect(
          tester.call.run,
          isA<Iterable<ResultNullary<int>>>(),
          reason: 'Type should be predictable',
        );
      });
    });
    group('runVoid', () {
      final tester = Stub.nullary<List<Nullary<int>>>()..stub = () => [];

      setUp(tester.reset);
      test(
          'GIVEN a tester List<Nullary<int> '
          'WHEN tester.call.runVoid '
          'THEN returns a Iterable<VoidResultNullary>', () {
        expect(
          tester.call.runVoid,
          isA<Iterable<VoidResultNullary>>(),
          reason: 'Type should be predictable',
        );
      });
    });
  });

  group('IterableUnaryToResultUnaryX', () {
    group('run', () {
      final tester = Stub.nullary<List<Unary<int, int>>>()..stub = () => [];

      setUp(tester.reset);

      test(
          'GIVEN a tester List<Nullary<T> '
          'WHEN tester.call.run '
          'THEN returns a Iterable<ResultUnary<T, S>>', () {
        expect(
          tester.call.run,
          isA<Iterable<ResultUnary<int, int>>>(),
          reason: 'Type should be predictable',
        );
      });
    });
    group('runVoid', () {
      final tester = Stub.nullary<List<Unary<int, int>>>()..stub = () => [];

      setUp(tester.reset);
      test(
          'GIVEN a tester List<Nullary<int> '
          'WHEN tester.call.runVoid '
          'THEN returns a Iterable<VoidResultUnary<S>>', () {
        expect(
          tester.call.runVoid,
          isA<Iterable<VoidResultUnary<int>>>(),
          reason: 'Type should be predictable',
        );
      });
    });
  });

  group('IterableNullaryToResultNullaryAsyncX', () {
    group('run', () {
      final tester = Stub.nullary<List<NullaryAsync<int>>>()..stub = () => [];

      setUp(tester.reset);

      test(
          'GIVEN a tester Iterable<NullaryAsync<T> '
          'WHEN tester.call.runAsync '
          'THEN returns a  Iterable<ResultNullaryAsync<T>>', () {
        expect(
          tester.call.runAsync,
          isA<Iterable<ResultNullaryAsync<int>>>(),
          reason: 'Type should be predictable',
        );
      });
    });
    group('runVoid', () {
      final tester = Stub.nullary<List<NullaryAsync<int>>>()..stub = () => [];

      setUp(tester.reset);
      test(
          'GIVEN a tester List<NullaryAsync<int>> '
          'WHEN tester.call.runVoidAsync '
          'THEN returns a Iterable<VoidResultNullaryAsync>', () {
        expect(
          tester.call.runVoidAsync,
          isA<Iterable<VoidResultNullaryAsync>>(),
          reason: 'Type should be predictable',
        );
      });
    });
  });

  group('group IterableUnaryToResultUnaryX', () {
    group('run', () {
      final tester = Stub.nullary<List<UnaryFutureOr<int, int>>>()
        ..stub = () => [];

      setUp(tester.reset);

      test(
          'GIVEN a tester Iterable<UnaryFutureOr<T, S>> '
          'WHEN tester.call.runAsync '
          'THEN returns a Iterable<ResultUnaryAsync<T, S>>', () {
        expect(
          tester.call.runAsync,
          isA<Iterable<ResultUnaryAsync<int, int>>>(),
          reason: 'Type should be predictable',
        );
      });
    });
    group('run', () {
      final tester = Stub.nullary<List<Unary<int, int>>>()..stub = () => [];

      setUp(tester.reset);
      test(
          'GIVEN a tester List<Nullary<int> '
          'WHEN tester.call.runVoid '
          'THEN returns aIterable<VoidResultUnaryAsync<S>>', () {
        expect(
          tester.call.runVoidAsync,
          isA<Iterable<VoidResultUnaryAsync<int>>>(),
          reason: 'Type should be predictable',
        );
      });
    });
  });
}
