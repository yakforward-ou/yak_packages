import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_result/yak_result.dart';

void main() {
  group('ValueResultAsVoidX', () {
    final tester = Stub.nullary<ValueResult>();

    setUp(tester.reset);

    test('GIVEN tester is a Failure ' 'WHEN "asVoid" ' 'THEN return a Failure',
        () {
      tester.stub = () => Failure();
      expect(
        tester().asVoid,
        isA<Failure>(),
        reason: 'should be a failure',
      );

      expect(
        tester().asVoid,
        isA<VoidResult>(),
        reason: 'should be a VoidResult',
      );
    });

    test('GIVEN tester is a Failure ' 'WHEN "asVoid" ' 'THEN return a Failure',
        () {
      tester.stub = () => ValueSuccess(0);

      expect(
        tester().asVoid,
        isA<Success>(),
        reason: 'should be a Success',
      );
      expect(
        tester().asVoid,
        isA<VoidResult>(),
        reason: 'should be a VoidResult',
      );
    });
  });
}
