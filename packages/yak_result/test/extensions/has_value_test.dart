import 'package:test/test.dart';
import 'package:yak_result/yak_result.dart';
import 'package:stub/stub.dart';

void main() {
  group('ResultHasValueX', () {
    group('"Success"', () {
      final tester = Stub.nullary<Result>();

      setUp(tester.reset);

      test(
          'GIVEN Result is a Success with value '
          'WHEN .hasValue '
          'THEN should return true', () {
        tester.stub = () => Success(0);

        expect(
          tester().hasValue,
          isTrue,
          reason: 'should return true',
        );
      });

      test(
          'GIVEN Result is a Success without value '
          'WHEN .hasValue '
          'THEN should return false', () {
        tester.stub = () => Success();

        expect(
          tester().hasValue,
          isFalse,
          reason: 'should return false',
        );
      });
    });
    group('"Failure"', () {
      final tester = Stub.nullary<Result>();

      setUp(tester.reset);

      test(
          'GIVEN Result is a Failure '
          'WHEN .hasValue '
          'THEN should return false', () {
        tester.stub = () => Failure();

        expect(
          tester().hasValue,
          isFalse,
          reason: 'should return false',
        );
      });
    });
  });
}
