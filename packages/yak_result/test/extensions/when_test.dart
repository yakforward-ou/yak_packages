import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_result/yak_result.dart';

void main() {
  group('WhenX', () {
    const data = 'hello';
    final fail = 0;
    final result = nullaryStub<Result<String>>();
    final onSuccess = unaryStub<int, String>()..stub = (i) => i.length;
    final onFailure = unaryStub<int, Failure<String>>()..stub = (f) => fail;

    test('GIVEN ... ' 'WHEN is Success' 'THEN function is called', () {
      onSuccess.reset;
      onFailure.reset;

      result
        ..reset
        ..stub = () => const Success(data);

      expect(
        result.wrap().when(success: onSuccess.wrap, failure: onFailure.wrap),
        data.length,
        reason: 'should be correct',
      );

      expect(
        onSuccess.count,
        1,
        reason: 'should called once',
      );

      expect(
        onFailure.count,
        0,
        reason: 'should not called',
      );
    });

    test('GIVEN ... ' 'WHEN is Success' 'THEN function is called', () {
      onSuccess.reset;
      onFailure.reset;
      result
        ..reset
        ..stub = () => Failure();

      expect(
        result.wrap().when(success: onSuccess.wrap, failure: onFailure.wrap),
        fail,
        reason: 'should be correct',
      );

      expect(
        onFailure.count,
        1,
        reason: 'should called once',
      );

      expect(
        onSuccess.count,
        0,
        reason: 'should not called',
      );
    });
  });

  group('WhenAsyncX', () {
    const data = 'hello';
    final fail = 0;
    final result = nullaryStub<Future<Result<String>>>();
    final onSuccess = unaryStub<int, String>()..stub = (i) => i.length;
    final onFailure = unaryStub<int, Failure<String>>()..stub = (f) => fail;

    test('GIVEN ... ' 'WHEN is Success' 'THEN function is called', () async {
      onSuccess.reset;
      onFailure.reset;
      result
        ..reset
        ..stub = () async => const Success(data);

      expect(
        await result
            .wrap()
            .when(success: onSuccess.wrap, failure: onFailure.wrap),
        data.length,
        reason: 'should be correct',
      );

      expect(
        onSuccess.count,
        1,
        reason: 'should called once',
      );

      expect(
        onFailure.count,
        0,
        reason: 'should not called',
      );
    });

    test('GIVEN ... ' 'WHEN is Success' 'THEN function is called', () async {
      onSuccess.reset;
      onFailure.reset;
      result
        ..reset
        ..stub = () async => Failure();

      expect(
        await result
            .wrap()
            .when(success: onSuccess.wrap, failure: onFailure.wrap),
        fail,
        reason: 'should be correct',
      );

      expect(
        onFailure.count,
        1,
        reason: 'should called once',
      );

      expect(
        onSuccess.count,
        0,
        reason: 'should not called',
      );
    });
  });
}
