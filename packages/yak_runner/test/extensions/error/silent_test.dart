import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  group('`ErrorHandlerSilentX`', () {
    test(
        'Given `T extends Error'
        'WHEN `silent`  '
        'THEN return  ErrorHandler<T>', () {
      expect(
        AssertionError().silent,
        isA<ErrorHandler<AssertionError>>(),
        reason: 'should return `ErrorHandler`',
      );
    });
  });
}
