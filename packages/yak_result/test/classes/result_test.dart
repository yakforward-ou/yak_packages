import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_result/yak_result.dart';

void main() {
  group('Result Test', () {
    group('Success Type maching', () {
      final tester = Stub.nullary<Result<bool>>();
      final negative = Stub.nullary<Result<int>>();

      setUp(() {
        tester.reset();
        negative.reset();
      });

      test(
          'GIVEN Result<T> '
          'WHEN this is Result<T> '
          'THEN return true', () {
        tester.stub = () => const Result.success(false);

        expect(
          tester(),
          isA<Result<bool>>(),
          reason: 'type should be predictable',
        );
      });

      test(
          'GIVEN Result<S> '
          'WHEN this is Result<T> '
          'THEN return false', () {
        tester.stub = () => const Result.success(false);
        negative.stub = () => const Result.success(1);

        expect(
          tester(),
          isNot(equals(negative())),
          reason: 'type should be predictable',
        );
      });

      test(
          'GIVEN Results<T> and Results<S> '
          'WHEN results are equals'
          'THEN equality return true', () {
        tester.stub = () => const Result.success(false);

        expect(
          tester(),
          equals(const Result.success(false)),
          reason: 'type should be predictable',
        );
      });
    });

    group('Failure Type maching', () {
      final tester = Stub.nullary<Result<bool>>();
      final negative = Stub.nullary<Result<int>>();

      setUp(() {
        tester.reset();
        negative.reset();
      });

      test(
          'GIVEN Result.failure<T> '
          'WHEN this is Result.failure<T> '
          'THEN return true', () {
        tester.stub = () => Result.failure();

        expect(
          tester(),
          isA<Result<bool>>(),
          reason: 'type should be predictable',
        );
      });

      test(
          'GIVEN Success<S> '
          'WHEN this is Result<T> '
          'THEN return false', () {
        tester.stub = () => Result.failure();
        negative.stub = () => Result.failure();

        expect(
          tester(),
          isNot(equals(negative())),
          reason: 'type should be predictable',
        );
      });
    });
    group('Result isSuccess/isFailure test', () {
      final tester = Stub.nullary<Result<bool>>();

      setUp(tester.reset);

      test(
          'GIVEN Result.success '
          'WHEN isSuccess '
          'THEN return true', () {
        tester.stub = () => const Result.success(false);

        expect(
          tester().isSuccess,
          isTrue,
          reason: 'result should be predictable',
        );
      });

      test(
          'GIVEN Result.success '
          'WHEN isFailure '
          'THEN return false', () {
        tester.stub = () => const Result.success(false);

        expect(
          tester().isFailure,
          isFalse,
          reason: 'result should be predictable',
        );
      });
      test(
          'GIVEN Result.failure '
          'WHEN isSuccess '
          'THEN return false', () {
        tester.stub = () => Result.failure();

        expect(
          tester().isSuccess,
          isFalse,
          reason: 'result should be predictable',
        );
      });

      test(
          'GIVEN Result.failure '
          'WHEN isFailure '
          'THEN return true', () {
        tester.stub = () => Result.failure();

        expect(
          tester().isFailure,
          isTrue,
          reason: 'result should be predictable',
        );
      });
    });
    group('Result asSuccess/asFailure test', () {
      final tester = Stub.nullary<Result<bool>>();

      setUp(tester.reset);

      test(
          'GIVEN Result<T>.success '
          'WHEN asSuccess '
          'THEN return T', () {
        tester.stub = () => const Result.success(false);

        expect(
          tester().asSuccess,
          isA<bool>(),
          reason: 'result should be predictable',
        );
      });

      test(
          'GIVEN Result.success '
          'WHEN isFailure '
          'THEN throws Exception', () {
        tester.stub = () => const Result.success(false);

        expect(
          () => tester().asFailure,
          throwsException,
          reason: 'result should be predictable',
        );
      });
      test(
          'GIVEN Result.failure '
          'WHEN asSuccess '
          'THEN throws Exception', () {
        tester.stub = () => Result.failure();

        expect(
          () => tester().asSuccess,
          throwsException,
          reason: 'result should be predictable',
        );
      });

      test(
          'GIVEN Result.failure '
          'WHEN isFailure '
          'THEN return true', () {
        tester.stub = () => Result.failure();

        expect(
          tester().asFailure,
          isA<Failure>(),
          reason: 'result should be predictable',
        );
      });
    });
  });
}
