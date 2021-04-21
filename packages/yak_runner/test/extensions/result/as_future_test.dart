import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('ResultAsFutureX', () {
    test('WHEN Success.asFuture' 'THEN returns Future<Result>', () {
      final runner = Runner(() => 'hello');
      expect(
        runner().asFuture,
        isA<Future<Result<String>>>(),
        reason: 'should be a Future<Result>',
      );
    });
    test('WHEN Success.asFuture' 'THEN returns Future<Result>', () {
      expect(
        Success('hello').asFuture,
        isA<Future<Result<String>>>(),
        reason: 'should be a Future<Result>',
      );
    });
    test('WHEN Failure.asFuture' 'THEN returns Future<Result>', () {
      expect(
        Success('hello').asFuture,
        isA<Future<Result<String>>>(),
        reason: 'should be a Future<Result>',
      );
    });
  });
}
