import 'package:test/test.dart';
import 'package:yak_error_handler/yak_error_handler.dart';

void main() {
  group('`SilenceErrorX`', () {
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
