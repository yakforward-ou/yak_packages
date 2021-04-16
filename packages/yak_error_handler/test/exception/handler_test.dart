import 'package:test/test.dart';
import 'package:yak_error_handler/yak_error_handler.dart';

import '../stub/exception_handler_delegate.dart';

void main() {
  group('`ExceptionHandler test`', () {
    final handler = MockHandleExceptionDelegate();
    final secondHandler = MockHandleExceptionDelegate();

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
      handler.stub
        ..reset
        ..stub = (_) {};

      try {
        throw Exception();
      } on Exception catch (e, s) {
        ExceptionHandler()(e, s);
      }

      expect(
        handler.stub.count,
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
        handler.stub.count,
        2,
        reason: '`handleError` should be triggered',
      );
    });

    test(
        'WHEN `ExceptionHandler` `handleError` is changed '
        'THEN should updated `', () {
      ExceptionHandler()..handleException = secondHandler;

      secondHandler.stub
        ..reset
        ..stub = (_) {};

      try {
        throw Exception();
      } on Exception catch (e, s) {
        ExceptionHandler()(e, s);
      }

      expect(
        secondHandler.stub.count,
        1,
        reason: '`handleError` should be triggered',
      );
    });
  });
}
