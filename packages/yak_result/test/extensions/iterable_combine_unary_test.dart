import 'package:test/test.dart';
import 'package:stub/stub.dart';

import 'package:yak_result/yak_result.dart';

void main() {
  const seed = 0;

  group('IterableUnaryCombineValueResultX', () {
    group('combine', () {
      final failure = Stub.unary<ValueResult<int>, int>()
        ..stub = (i) => const Failure();

      final success = Stub.unary<ValueResult<int>, int>()
        ..stub = (i) => Success.value(i);

      final tester = Stub.nullary<Iterable<ResultUnary<int, int>>>();

      setUp(() {
        tester.reset();
        failure.reset();
        success.reset();
      });

      test(
          'GIVEN tester is a Iterable<ResultNullary<int>> '
          'WHEN tester().combine '
          'THEN success a ValueResult<List<T>>', () {
        tester.stub = () => [];

        expect(
          tester().combine,
          isA<ResultUnary<List<int>, int>>(),
          reason: 'Type should be predictable',
        );
      });

      test(
          'GIVEN tester contains "failure" nullary '
          'WHEN tester().combine() '
          'THEN success Failure', () {
        tester.stub = () => [failure, success];

        expect(
          tester().combine(seed),
          isA<Failure>(),
          reason: 'should return a Failure',
        );

        expect(
          failure.count,
          equals(1),
          reason: 'should be called once',
        );
      });

      test(
          'GIVEN tester contains "failure" nullary '
          'WHEN tester().combine() '
          'THEN functions after "failure" are not called', () {
        tester.stub = () => [failure, success];

        expect(
          tester().combine(seed),
          isA<Failure>(),
          reason: 'should return a Failure',
        );

        expect(
          failure.count,
          equals(1),
          reason: '"failure" should be called once',
        );

        expect(
          success.count,
          equals(0),
          reason: '"success" should not be called',
        );
      });
      test(
          'GIVEN tester contains only "success"s nullary '
          'WHEN tester().combine() '
          'THEN success Success', () {
        tester.stub = () => [success, success];

        expect(
          tester().combine(seed),
          isA<Success>(),
          reason: 'should return a Success',
        );
      });
    });

    group('combineVoid', () {
      final failure = Stub.unary<ValueResult<int>, int>()
        ..stub = (i) => const Failure();

      final success = Stub.unary<ValueResult<int>, int>()
        ..stub = (i) => Success.value(i);

      final tester = Stub.nullary<Iterable<ResultUnary<int, int>>>();

      setUp(() {
        tester.reset();
        failure.reset();
        success.reset();
      });

      test(
          'GIVEN tester is a Iterable<ResultUnary<int,int>> '
          'WHEN tester().combineVoid '
          'THEN success a ValueResult<List<T>>', () {
        tester.stub = () => [];

        expect(
          tester().combineVoid,
          isA<VoidResultUnary<int>>(),
          reason: 'Type should be predictable',
        );
      });

      test(
          'GIVEN tester contains "failure" nullary '
          'WHEN tester().combineVoid() '
          'THEN success Failure', () {
        tester.stub = () => [failure, success];

        expect(
          tester().combineVoid(seed),
          isA<Failure>(),
          reason: 'should return a Failure',
        );

        expect(
          failure.count,
          equals(1),
          reason: 'should be called once',
        );
      });

      test(
          'GIVEN tester contains "failure" nullary '
          'WHEN tester().combineVoid() '
          'THEN functions after "failure" are not called', () {
        tester.stub = () => [failure, success];

        expect(
          tester().combineVoid(seed),
          isA<Failure>(),
          reason: 'should return a Failure',
        );

        expect(
          failure.count,
          equals(1),
          reason: '"failure" should be called once',
        );

        expect(
          success.count,
          equals(0),
          reason: '"success" should not be called',
        );
      });
      test(
          'GIVEN tester contains only "success"s nullary '
          'WHEN tester().combineVoid() '
          'THEN success Success', () {
        tester.stub = () => [success, success];

        expect(
          tester().combineVoid(seed),
          isA<Success>(),
          reason: 'should return a Success',
        );
      });
    });
  });
  group('IterableUnaryCombineVoidResultX', () {
    group('combine', () {
      final failure = Stub.unary<VoidResult<void>, int>()
        ..stub = (i) => const Failure();

      final success = Stub.unary<VoidResult<void>, int>()
        ..stub = (i) => Success.empty;

      final tester = Stub.nullary<Iterable<VoidResultUnary<int>>>();

      setUp(() {
        tester.reset();
        failure.reset();
        success.reset();
      });

      test(
          'GIVEN tester is a Iterable<VoidResultUnary> '
          'WHEN tester().combine '
          'THEN success a ValueResult<List<T>>', () {
        tester.stub = () => [];

        expect(
          tester().combine,
          isA<VoidResultUnary<int>>(),
          reason: 'Type should be predictable',
        );
      });

      test(
          'GIVEN tester contains "failure" nullary '
          'WHEN tester().combine() '
          'THEN success Failure', () {
        tester.stub = () => [failure, success];

        expect(
          tester().combine(seed),
          isA<Failure>(),
          reason: 'should return a Failure',
        );

        expect(
          failure.count,
          equals(1),
          reason: 'should be called once',
        );
      });

      test(
          'GIVEN tester contains "failure" nullary '
          'WHEN tester().combine() '
          'THEN functions after "failure" are not called', () {
        tester.stub = () => [failure, success];

        expect(
          tester().combine(seed),
          isA<Failure>(),
          reason: 'should return a Failure',
        );

        expect(
          failure.count,
          equals(1),
          reason: '"failure" should be called once',
        );

        expect(
          success.count,
          equals(0),
          reason: '"success" should not be called',
        );
      });
      test(
          'GIVEN tester contains only "success"s nullary '
          'WHEN tester().combine() '
          'THEN success Success', () {
        tester.stub = () => [success, success];

        expect(
          tester().combine(seed),
          isA<Success>(),
          reason: 'should return a Success',
        );
      });
    });
  });
}
