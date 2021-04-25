import 'package:test/test.dart';
import 'package:yak_error_handler/yak_error_handler.dart';
// ignore_for_file: avoid_catching_errors

void main() {
  group('AvowError & avow', () {
    test(
        'WHEN `avow(false)`'
        'THEN should throw `AvowError`', () {
      expect(
        () {
          avow(false);
        },
        throwsA(isA<AvowError>()),
        reason: 'should throw an `AvowError`',
      );
    });

    test(
        'WHEN `avow(true)`'
        'THEN should succees', () {
      expect(
        () {
          avow(true);
        },
        isA<void>(),
        reason: 'should NOT throw an `AvowError`',
      );
    });
  });
}
