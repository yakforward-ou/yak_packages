import 'package:test/test.dart';
import 'package:yak_error_handler/yak_error_handler.dart';
// ignore_for_file: avoid_catching_errors

void main() {
  group('AsTypeError test', () {
    test(
        'WHEN `toString` is called'
        'THEN outputs a predictable result', () {
      const s = 0;
      var message;

      try {
        s.as<String>();
      } on AsTypeError catch (e) {
        message = '$e';
      }
      expect(
        message,
        'AsTypeError: int cannot be casted as String',
        reason: '`toString` should be predicatble',
      );
    });
  });
}
