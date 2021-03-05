import 'package:test/test.dart';
import 'package:yak_error_handler/yak_error_handler.dart';

import '../stub/all.dart';

void main() {
  group('`YakErrorHandler`', () {
    final handler = HandleExceptionDelegateStub();
    final secondHandler = HandleExceptionDelegateStub();

    test('WHEN no `Catch` set THEN does not throw`', () {
      var err = 0;
      try {
        ExceptionHandler()(Exception(), StackTrace.empty);
      } catch (_) {
        err++;
      }
      expect(err < 1, true);
    });

    test('WHEN `function` throws THEN `handleError` should be triggered `', () {
      ExceptionHandler()..handleException = handler;
      handler
        ..reset
        ..stub = () {};

      try {
        throw Exception();
      } on Exception catch (e, s) {
        ExceptionHandler()(e, s);
      }

      expect(
        handler.callCount,
        1,
        reason: '`handleError` should be triggered',
      );
    });
    test(
        'WHEN `ExceptionHandler` is unchanged '
        'THEN should retain config across tests`', () {
      try {
        throw Exception();
      } on Exception catch (e, s) {
        ExceptionHandler()(e, s);
      }

      expect(
        handler.callCount,
        2,
        reason: '`handleError` should be triggered',
      );
    });

    test(
        'WHEN `YakErrorHandler` `handleError` is changed '
        'THEN should updated `', () {
      ExceptionHandler()..handleException = secondHandler;

      secondHandler
        ..reset
        ..stub = () {};

      try {
        throw Exception();
      } on Exception catch (e, s) {
        ExceptionHandler()(e, s);
      }

      expect(
        secondHandler.callCount,
        1,
        reason: '`handleError` should be triggered',
      );
    });
  });
}
