import 'package:test/test.dart';
import 'package:stub/stub.dart';

import 'package:yak_result/yak_result.dart';

void main() {
  group('Nullary', () {
    group('combine Test', () {
      final failure = Stub.nullary<Result<bool>>()
        ..stub = () => Result.failure();

      final success = Stub.nullary<Result<bool>>()
        ..stub = () => Result.success(true);

      final tester = Stub.nullary<Iterable<ResultNullary<bool>>>();

      setUp(() {
        tester.reset();
        failure.reset();
        success.reset();
      });

      test(
          'GIVEN tester is a Iterable<ResultNullary<T>> '
          'WHEN tester().combine '
          'THEN returns a ResultNullary<List<T>>', () {
        tester.stub = () => [];

        expect(
          tester().combine,
          isA<ResultNullary<List<bool>>>(),
          reason: 'Type should be predictable',
        );
      });

      test(
          'GIVEN tester contains "failure" nullary '
          'WHEN tester().combine() '
          'THEN returns a Failure', () {
        tester.stub = () => [failure.call, success.call];

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
          'GIVEN tester contains "failure" before "success" '
          'WHEN tester().combine() '
          'THEN success is never called', () {
        tester.stub = () => [failure.call, success.call];

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

        expect(
          success.count,
          equals(0),
          reason: 'should not be called',
        );
      });

      test(
          'GIVEN tester contains only "success" '
          'WHEN tester().combine() '
          'THEN result is a Success', () {
        tester.stub = () => [success.call, success.call];

        expect(
          tester().combine().isSuccess,
          isTrue,
          reason: 'should return a success',
        );
      });

      test(
          'GIVEN tester contains 2 "success" '
          'WHEN tester().combine() '
          'THEN success is called twice', () {
        tester.stub = () => [success.call, success.call];
        tester().combine();
        expect(
          success.count,
          equals(2),
          reason: 'should be called twice',
        );
      });
    });

    group(' combineVoid Test', () {
      final failure = Stub.nullary<Result<bool>>()
        ..stub = () => Result.failure();

      final success = Stub.nullary<Result<bool>>()
        ..stub = () => Result.success(true);

      final tester = Stub.nullary<Iterable<ResultNullary<bool>>>();

      setUp(() {
        tester.reset();
        failure.reset();
        success.reset();
      });

      test(
          'GIVEN tester is a Iterable<ResultNullary<T>> '
          'WHEN tester().combineVoid '
          'THEN returns a VoidResultNullary', () {
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
          'THEN returns a Failure', () {
        tester.stub = () => [failure.call, success.call];

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
          'THEN returns a VoidResult', () {
        tester.stub = () => [failure.call, success.call];
        expect(
          tester().combineVoid(),
          isA<VoidResult>(),
          reason: 'should return a Failure',
        );

        expect(
          failure.count,
          equals(1),
          reason: 'should be called once',
        );
      });

      test(
          'GIVEN tester contains "failure" before "success" '
          'WHEN tester().combine() '
          'THEN success is never called', () {
        tester.stub = () => [failure.call, success.call];

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

        expect(
          success.count,
          equals(0),
          reason: 'should not be called',
        );
      });

      test(
          'GIVEN tester contains only "success" '
          'WHEN tester().combine() '
          'THEN result is a Success', () {
        tester.stub = () => [success.call, success.call];

        expect(
          tester().combineVoid().isSuccess,
          isTrue,
          reason: 'should return a success',
        );
      });

      test(
          'GIVEN tester contains 2 "success" '
          'WHEN tester().combine() '
          'THEN success is called twice', () {
        tester.stub = () => [success.call, success.call];
        tester().combineVoid();
        expect(
          success.count,
          equals(2),
          reason: 'should be called twice',
        );
      });
    });
  });

  group('Unary', () {
    const seed = 0;
    group('combine Test', () {
      final failure = Stub.unary<Result<bool>, int>()
        ..stub = (i) => Result.failure();

      final success = Stub.unary<Result<bool>, int>()
        ..stub = (i) => Result.success(true);

      final tester = Stub.nullary<Iterable<ResultUnary<bool, int>>>();

      setUp(() {
        tester.reset();
        failure.reset();
        success.reset();
      });

      test(
          'GIVEN tester is a Iterable<ResultNullary<T>> '
          'WHEN tester().combine '
          'THEN returns a ResultNullary<List<T>>', () {
        tester.stub = () => [];

        expect(
          tester().combine,
          isA<ResultUnary<List<bool>, int>>(),
          reason: 'Type should be predictable',
        );
      });

      test(
          'GIVEN tester contains "failure" nullary '
          'WHEN tester().combine() '
          'THEN returns a Failure', () {
        tester.stub = () => [failure.call, success.call];

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
          'GIVEN tester contains "failure" before "success" '
          'WHEN tester().combine() '
          'THEN success is never called', () {
        tester.stub = () => [failure.call, success.call];

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

        expect(
          success.count,
          equals(0),
          reason: 'should not be called',
        );
      });

      test(
          'GIVEN tester contains only "success" '
          'WHEN tester().combine() '
          'THEN result is a Success', () {
        tester.stub = () => [success.call, success.call];

        expect(
          tester().combine(seed).isSuccess,
          isTrue,
          reason: 'should return a success',
        );
      });

      test(
          'GIVEN tester contains 2 "success" '
          'WHEN tester().combine() '
          'THEN success is called twice', () {
        tester.stub = () => [success.call, success.call];
        tester().combine(seed);
        expect(
          success.count,
          equals(2),
          reason: 'should be called twice',
        );
      });
    });

    group(' combineVoid Test', () {
      group('combine Test', () {
        final failure = Stub.unary<Result<bool>, int>()
          ..stub = (i) => Result.failure();

        final success = Stub.unary<Result<bool>, int>()
          ..stub = (i) => Result.success(true);

        final tester = Stub.nullary<Iterable<ResultUnary<bool, int>>>();

        setUp(() {
          tester.reset();
          failure.reset();
          success.reset();
        });

        test(
            'GIVEN tester is a Iterable<ResultUnary<T>> '
            'WHEN tester().combineVoid '
            'THEN returns a VoidResultUnary', () {
          tester.stub = () => [];

          expect(
            tester().combineVoid,
            isA<VoidResultUnary<int>>(),
            reason: 'Type should be predictable',
          );
        });

        test(
            'GIVEN tester contains "failure" '
            'WHEN tester().combineVoid() '
            'THEN returns a Failure', () {
          tester.stub = () => [failure.call, success.call];

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
            'GIVEN tester contains "failure" '
            'WHEN tester().combineVoid() '
            'THEN returns a VoidResult', () {
          tester.stub = () => [failure.call, success.call];

          expect(
            tester().combineVoid(seed),
            isA<VoidResult>(),
            reason: 'should return a Failure',
          );

          expect(
            failure.count,
            equals(1),
            reason: 'should be called once',
          );
        });

        test(
            'GIVEN tester contains "failure" before "success" '
            'WHEN tester().combine() '
            'THEN success is never called', () {
          tester.stub = () => [failure.call, success.call];

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

          expect(
            success.count,
            equals(0),
            reason: 'should not be called',
          );
        });

        test(
            'GIVEN tester contains only "success" '
            'WHEN tester().combine() '
            'THEN result is a Success', () {
          tester.stub = () => [success.call, success.call];

          expect(
            tester().combineVoid(seed).isSuccess,
            isTrue,
            reason: 'should return a success',
          );
        });

        test(
            'GIVEN tester contains 2 "success" '
            'WHEN tester().combine() '
            'THEN success is called twice', () {
          tester.stub = () => [success.call, success.call];
          tester().combineVoid(seed);
          expect(
            success.count,
            equals(2),
            reason: 'should be called twice',
          );
        });
      });
    });
  });
}
  //   group('combine', () {
  //     final failure = Stub.nullary<ValueResult<int>>()
  //       ..stub = () => const Failure();

  //     final success = Stub.nullary<ValueResult<int>>()
  //       ..stub = () => Success.value(0);

  //     final tester = Stub.nullary<Iterable<ResultNullary<int>>>();

  //     setUp(() {
  //       tester.reset();
  //       failure.reset();
  //       success.reset();
  //     });


  //     test(
  //         'GIVEN tester contains "failure" nullary '
  //         'WHEN tester().combine() '
  //         'THEN success Failure', () {
  //       tester.stub = () => [failure.call, success.call];

  //       expect(
  //         tester().combine(),
  //         isA<Failure>(),
  //         reason: 'should return a Failure',
  //       );

  //       expect(
  //         failure.count,
  //         equals(1),
  //         reason: 'should be called once',
  //       );
  //     });

  //     test(
  //         'GIVEN tester contains "failure" nullary '
  //         'WHEN tester().combine() '
  //         'THEN functions after "failure" are not called', () {
  //       tester.stub = () => [failure.call, success.call];

  //       expect(
  //         tester().combine(),
  //         isA<Failure>(),
  //         reason: 'should return a Failure',
  //       );

  //       expect(
  //         failure.count,
  //         equals(1),
  //         reason: '"failure" should be called once',
  //       );

  //       expect(
  //         success.count,
  //         equals(0),
  //         reason: '"success" should not be called',
  //       );
  //     });
  //     test(
  //         'GIVEN tester contains only "success"s nullary '
  //         'WHEN tester().combine() '
  //         'THEN success Success', () {
  //       tester.stub = () => [success.call, success.call];

  //       expect(
  //         tester().combine(),
  //         isA<Success>(),
  //         reason: 'should return a Success',
  //       );
  //     });
  //   });

  //   group('combineVoid', () {
  //     final failure = Stub.nullary<ValueResult<int>>()
  //       ..stub = () => const Failure();

  //     final success = Stub.nullary<ValueResult<int>>()
  //       ..stub = () => Success.value(0);

  //     final tester = Stub.nullary<Iterable<ResultNullary<int>>>();

  //     setUp(() {
  //       tester.reset();
  //       failure.reset();
  //       success.reset();
  //     });

  //     test(
  //         'GIVEN tester is a Iterable<ResultNullary<int>> '
  //         'WHEN tester().combineVoid '
  //         'THEN success a ValueResult<List<T>>', () {
  //       tester.stub = () => [];

  //       expect(
  //         tester().combineVoid,
  //         isA<VoidResultNullary>(),
  //         reason: 'Type should be predictable',
  //       );
  //     });

  //     test(
  //         'GIVEN tester contains "failure" nullary '
  //         'WHEN tester().combineVoid() '
  //         'THEN success Failure', () {
  //       tester.stub = () => [failure.call, success.call];

  //       expect(
  //         tester().combineVoid(),
  //         isA<Failure>(),
  //         reason: 'should return a Failure',
  //       );

  //       expect(
  //         failure.count,
  //         equals(1),
  //         reason: 'should be called once',
  //       );
  //     });

  //     test(
  //         'GIVEN tester contains "failure" nullary '
  //         'WHEN tester().combineVoid() '
  //         'THEN functions after "failure" are not called', () {
  //       tester.stub = () => [failure.call, success.call];

  //       expect(
  //         tester().combineVoid(),
  //         isA<Failure>(),
  //         reason: 'should return a Failure',
  //       );

  //       expect(
  //         failure.count,
  //         equals(1),
  //         reason: '"failure" should be called once',
  //       );

  //       expect(
  //         success.count,
  //         equals(0),
  //         reason: '"success" should not be called',
  //       );
  //     });
  //     test(
  //         'GIVEN tester contains only "success"s nullary '
  //         'WHEN tester().combineVoid() '
  //         'THEN success Success', () {
  //       tester.stub = () => [success.call, success.call];

  //       expect(
  //         tester().combineVoid(),
  //         isA<Success>(),
  //         reason: 'should return a Success',
  //       );
  //     });
  //   });
  // });
  // group('IterableNullaryCombineVoidResultX', () {
  //   group('combine', () {
  //     final failure = Stub.nullary<VoidResult>()..stub = () => const Failure();

  //     final success = Stub.nullary<VoidResult>()..stub = () => Success.empty;

  //     final tester = Stub.nullary<Iterable<VoidResultNullary>>();

  //     setUp(() {
  //       tester.reset();
  //       failure.reset();
  //       success.reset();
  //     });

  //     test(
  //         'GIVEN tester is a Iterable<VoidResultNullary> '
  //         'WHEN tester().combine '
  //         'THEN success a ValueResult<List<T>>', () {
  //       tester.stub = () => [];

  //       expect(
  //         tester().combine,
  //         isA<VoidResultNullary>(),
  //         reason: 'Type should be predictable',
  //       );
  //     });

  //     test(
  //         'GIVEN tester contains "failure" nullary '
  //         'WHEN tester().combine() '
  //         'THEN success Failure', () {
  //       tester.stub = () => [failure.call, success.call];

  //       expect(
  //         tester().combine(),
  //         isA<Failure>(),
  //         reason: 'should return a Failure',
  //       );

  //       expect(
  //         failure.count,
  //         equals(1),
  //         reason: 'should be called once',
  //       );
  //     });

  //     test(
  //         'GIVEN tester contains "failure" nullary '
  //         'WHEN tester().combine() '
  //         'THEN functions after "failure" are not called', () {
  //       tester.stub = () => [failure.call, success.call];

  //       expect(
  //         tester().combine(),
  //         isA<Failure>(),
  //         reason: 'should return a Failure',
  //       );

  //       expect(
  //         failure.count,
  //         equals(1),
  //         reason: '"failure" should be called once',
  //       );

  //       expect(
  //         success.count,
  //         equals(0),
  //         reason: '"success" should not be called',
  //       );
  //     });
  //     test(
  //         'GIVEN tester contains only "success"s nullary '
  //         'WHEN tester().combine() '
  //         'THEN success Success', () {
  //       tester.stub = () => [success.call, success.call];

  //       expect(
  //         tester().combine(),
  //         isA<Success>(),
  //         reason: 'should return a Success',
  //       );
  //     });
  //   });
  // });
// }
