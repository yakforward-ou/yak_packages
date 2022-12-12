import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_result/yak_result.dart';

void main() {
  group('Failure', () {
    group('Failure Type maching', () {
      final tester = Stub.nullary<Failure<bool>>();
      final negative = Stub.nullary<Failure<int>>();

      setUp(() {
        tester.reset();
        negative.reset();
      });

      test(
          'GIVEN Failure<T> '
          'WHEN this is Failure<T> '
          'THEN return true', () {
        tester.stub = () => Failure();

        expect(
          tester(),
          isA<Failure<bool>>(),
          reason: 'type should be predictable',
        );
      });

      test(
          'GIVEN Failure<S> '
          'WHEN this is Failure<T> '
          'THEN return false', () {
        negative.stub = () => Failure();

        expect(
          negative(),
          isNot(isA<Failure<bool>>()),
          reason: 'type should be predictable',
        );
      });
      test(
          'GIVEN Failure '
          'WHEN this is Result '
          'THEN return true', () {
        tester.stub = () => Failure();

        expect(
          tester(),
          isA<Result>(),
          reason: 'type should be predictable',
        );
      });
    });
    group('deep equality', () {
      final reason = Exception();

      final tester = Stub.nullary<Result>();
      final negative = Stub.nullary<Result>();

      setUp(() {
        tester.reset();
        negative.reset();
      });

      test(
          'GIVEN Failure '
          'WHEN matched against different Failure '
          'THEN return false', () {
        tester.stub = () => Failure(reason);
        negative.stub = () => Failure();

        expect(
          tester(),
          isNot(equals(negative())),
          reason: 'type should be predictable',
        );
      });

      test(
          'GIVEN Failure'
          'WHEN  matched against identical Failure '
          'THEN return false', () {
        tester.stub = () => Failure(reason);
        negative.stub = () => Failure(reason);

        expect(
          tester(),
          equals(negative()),
          reason: 'type should be predictable',
        );
      });
    });
  });
}
