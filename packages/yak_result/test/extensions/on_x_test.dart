import 'package:stub/stub.dart';
import 'package:test/test.dart';
import 'package:yak_result/yak_result.dart';

void main() {
  const success = Success(null);
  final failure = Failure();
  group('OnSuccessX', () {
    final function = Stub.unary()..stub = (_) {};
    setUp(function.reset);

    test(
        'GIVEN Result is Success '
        'WHEN result.onSuccess(function) '
        'THEN function is called once', () {
      final Result result = success;
      result.onSuccess(function);
      expect(
        function.count,
        equals(1),
        reason: 'function should be called once',
      );
    });

    test(
        'GIVEN Result is Failure '
        'WHEN result.onSuccess(function) '
        'THEN function is not called', () {
      final Result result = failure;
      result.onSuccess(function);
      expect(
        function.count,
        equals(0),
        reason: 'function should NOT be called',
      );
    });
  });

  group('OnFailureX', () {
    final function = Stub.unary()..stub = (_) {};
    setUp(function.reset);

    test(
        'GIVEN Result is Success '
        'WHEN result.onFailure(function) '
        'THEN function is not called', () {
      final Result result = success;
      result.onFailure(function);
      expect(
        function.count,
        equals(0),
        reason: 'function should NOT be called',
      );
    });

    test(
        'GIVEN Result is Failure '
        'WHEN result.onFailure(function) '
        'THEN function is called once', () {
      final Result result = failure;
      result.onFailure(function);
      expect(
        function.count,
        equals(1),
        reason: 'function should be called once',
      );
    });
  });
}
