import 'package:test/test.dart';
import 'package:stub/stub.dart';

import 'package:yak_result/yak_result.dart';

void main() {
  group('IterableNullaryCombineValueResultX', () {
    group('combine', () {
      final failure = Stub.nullary<ValueResult<int>>()
        ..stub = () => const Failure();

      final success = Stub.nullary<ValueResult<int>>()
        ..stub = () => Success.value(0);

      final tester = Stub.nullary<Iterable<ResultNullary<int>>>();

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
          isA<ResultNullary<List<int>>>(),
          reason: 'Type should be predictable',
        );
      });

      test(
          'GIVEN tester contains "failure" nullary '
          'WHEN tester().combine() '
          'THEN success Failure', () {
        tester.stub = () => [failure, success];

        expect(
          tester().combine(),
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
          tester().combine(),
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
          tester().combine(),
          isA<Success>(),
          reason: 'should return a Success',
        );
      });
    });

    group('combineVoid', () {
      final failure = Stub.nullary<ValueResult<int>>()
        ..stub = () => const Failure();

      final success = Stub.nullary<ValueResult<int>>()
        ..stub = () => Success.value(0);

      final tester = Stub.nullary<Iterable<ResultNullary<int>>>();

      setUp(() {
        tester.reset();
        failure.reset();
        success.reset();
      });

      test(
          'GIVEN tester is a Iterable<ResultNullary<int>> '
          'WHEN tester().combineVoid '
          'THEN success a ValueResult<List<T>>', () {
        tester.stub = () => [];

        expect(
          tester().combineVoid,
          isA<VoidResultNullary>(),
          reason: 'Type should be predictable',
        );
      });

      test(
          'GIVEN tester contains "failure" nullary '
          'WHEN tester().combineVoid() '
          'THEN success Failure', () {
        tester.stub = () => [failure, success];

        expect(
          tester().combineVoid(),
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
          tester().combineVoid(),
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
          tester().combineVoid(),
          isA<Success>(),
          reason: 'should return a Success',
        );
      });
    });
  });
  group('IterableNullaryCombineVoidResultX', () {
    group('combine', () {
      final failure = Stub.nullary<VoidResult>()..stub = () => const Failure();

      final success = Stub.nullary<VoidResult>()..stub = () => Success.empty;

      final tester = Stub.nullary<Iterable<VoidResultNullary>>();

      setUp(() {
        tester.reset();
        failure.reset();
        success.reset();
      });

      test(
          'GIVEN tester is a Iterable<VoidResultNullary> '
          'WHEN tester().combine '
          'THEN success a ValueResult<List<T>>', () {
        tester.stub = () => [];

        expect(
          tester().combine,
          isA<VoidResultNullary>(),
          reason: 'Type should be predictable',
        );
      });

      test(
          'GIVEN tester contains "failure" nullary '
          'WHEN tester().combine() '
          'THEN success Failure', () {
        tester.stub = () => [failure, success];

        expect(
          tester().combine(),
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
          tester().combine(),
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
          tester().combine(),
          isA<Success>(),
          reason: 'should return a Success',
        );
      });
    });
  });
}
