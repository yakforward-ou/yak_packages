import 'package:test/test.dart';
import 'package:yak_error_handler/yak_error_handler.dart';
// ignore_for_file: avoid_catching_errors

void main() {
  group('AvowError & avow', () {
    test(
        'WHEN `toString` is called'
        'THEN outputs a predictable result', () {
      var message;
      try {
        avow(false, '...successfully');
      } on AvowError catch (e) {
        message = '$e';
      }
      expect(
        message,
        'Avow Error: "...successfully"',
        reason: '`toString` should be predicatble',
      );

      try {
        avow(false);
      } on AvowError catch (e) {
        message = '$e';
      }
      expect(
        message,
        'Avow Error',
        reason: '`toString` should be predicatble',
      );
    });
  });
}
