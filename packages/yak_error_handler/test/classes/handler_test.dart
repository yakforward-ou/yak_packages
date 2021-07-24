import 'package:test/test.dart';
import 'package:stub/stub.dart';

import 'package:yak_error_handler/yak_error_handler.dart';
// ignore_for_file: avoid_catching_errors

void main() {
  final stub = unaryStub<void, AvowError>()..stub = (_) {};
  final standard = ErrorHandler(stub.wrap);
  group('ErrorHandler test', () {
    test(
        'GIVEN ErrorHandler<AvowError>.call'
        'WHEN Error is  AvowError'
        'THEN result is not null', () {
      late final Error? error;
      try {
        avow(false, '...successfully');
      } on Error catch (e) {
        error = standard.covariant.call(e);
      }
      expect(
        error,
        isNotNull,
        reason: 'error should not be null',
      );
    });
    test(
        'GIVEN ErrorHandler<AvowError>.call'
        'WHEN Error is  AvowError'
        'THEN result is not null', () {
      late final Error? error;
      try {
        avow(false, '...successfully');
      } on Error catch (e) {
        error = standard.covariant(e);
      }
      expect(
        error,
        isNotNull,
        reason: 'error should not be null',
      );
    });
  });
}
