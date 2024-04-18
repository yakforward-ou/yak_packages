import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_result/yak_result.dart';

void main() {
  group('VoidResult Test', () {
    group('Type maching', () {
      final tester = Stub.nullary<VoidResult>();

      setUp(() {
        tester.reset();
      });

      test(
          'GIVEN VoidResult.success '
          'WHEN this is VoidResult '
          'THEN return true', () {
        tester.stub = () => const VoidResult.success();

        expect(
          tester(),
          isA<VoidResult>(),
          reason: 'type should be predictable',
        );
      });

      test(
          'GIVEN VoidResult.failure '
          'WHEN this is VoidResult '
          'THEN return true', () {
        tester.stub = () => const VoidResult.failure();

        expect(
          tester(),
          isA<VoidResult>(),
          reason: 'type should be predictable',
        );
      });
    });

    group('Result isSuccess/isFailure test', () {
      final tester = Stub.nullary<VoidResult>();

      setUp(tester.reset);

      test(
          'GIVEN Result.success '
          'WHEN isSuccess '
          'THEN return true', () {
        tester.stub = () => const VoidResult.success();

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
        tester.stub = () => const VoidResult.success();

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
        tester.stub = () => const VoidResult.failure();

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
        tester.stub = () => const VoidResult.failure();

        expect(
          tester().isFailure,
          isTrue,
          reason: 'result should be predictable',
        );
      });
    });
    group('Result asSuccess/asFailure test', () {
      final tester = Stub.nullary<VoidResult>();

      setUp(tester.reset);

      test(
          'GIVEN Result.success '
          'WHEN isFailure '
          'THEN throws Exception', () {
        tester.stub = () => const VoidResult.success();

        expect(
          () => tester().asFailure,
          throwsException,
          reason: 'result should be predictable',
        );
      });

      test(
          'GIVEN Result.failure '
          'WHEN isFailure '
          'THEN return true', () {
        tester.stub = () => const VoidResult.failure();

        expect(
          tester().asFailure,
          isA<Failure>(),
          reason: 'result should be predictable',
        );
      });
    });
  });
}
