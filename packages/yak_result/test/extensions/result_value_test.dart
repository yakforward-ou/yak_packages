import 'package:test/test.dart';
import 'package:yak_result/yak_result.dart';
import 'package:stub/stub.dart';

void main() {
  group('ResultValueX', () {
    group('"value"', () {
      group('"Success"', () {
        final tester = Stub.nullary<Result>();

        setUp(tester.reset);

        test(
            'GIVEN Result is a Success with value '
            'WHEN .hasValue '
            'THEN should return actual value', () {
          tester.stub = () => Success(0);

          expect(
            tester().value,
            isA<int>(),
            reason: 'should return actual value',
          );
        });

        test(
            'GIVEN Result is a Success without value '
            'WHEN .hasValue '
            'THEN should throw', () {
          tester.stub = () => Success();

          expect(
            () => tester().value,
            throwsA(isA<Exception>()),
            reason: 'should throw',
          );
        });
      });
      group('"Failure"', () {
        final tester = Stub.nullary<Result>();

        setUp(tester.reset);

        test(
            'GIVEN Result is a Failure '
            'WHEN .hasValue '
            'THEN should throw', () {
          tester.stub = () => Failure();

          expect(
            () => tester().value,
            throwsA(isA<Exception>()),
            reason: 'should throw',
          );
        });
      });
      group('"valueOrNull"', () {
        group('"Success"', () {
          final tester = Stub.nullary<Result>();

          setUp(tester.reset);

          test(
              'GIVEN Result is a Success with value '
              'WHEN .hasValue '
              'THEN should return actual value', () {
            tester.stub = () => Success(0);

            expect(
              tester().valueOrNull,
              isA<int>(),
              reason: 'should return actual value',
            );
          });

          test(
              'GIVEN Result is a Success without value '
              'WHEN .hasValue '
              'THEN should be null', () {
            tester.stub = () => Success();

            expect(
              tester().valueOrNull,
              isNull,
              reason: 'should be null',
            );
          });
        });
        group('"Failure"', () {
          final tester = Stub.nullary<Result>();

          setUp(tester.reset);

          test(
              'GIVEN Result is a Failure '
              'WHEN .hasValue '
              'THEN should throw', () {
            tester.stub = () => Failure();
            expect(
              tester().valueOrNull,
              isNull,
              reason: 'should be null',
            );
          });
        });
      });
    });
  });
}
