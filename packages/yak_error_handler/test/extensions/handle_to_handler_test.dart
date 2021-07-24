import 'package:test/test.dart';
import 'package:yak_error_handler/yak_error_handler.dart';

void main() {
  group('`ErrorHandlerX`', () {
    test(
        'Given `HandleError`<T>'
        'WHEN `handler()`  '
        'THEN return  ErrorHandler<T>', () {
      void handler(AssertionError error) {}

      expect(
        handler.handler(),
        isA<ErrorHandler<AssertionError>>(),
        reason: 'should return `ErrorHandler`',
      );
    });
    test(
        'Given `HandleError`<T>'
        'WHEN `handler(report:true)`  '
        'THEN returnedErrorHandler<T> report is `true`', () {
      void handler(AssertionError error) {}
      final withReport = handler.handler(report: true);
      expect(
        withReport.report,
        isTrue,
        reason: 'report should be "true"',
      );
      expect(
        withReport.shouldRethrow,
        isFalse,
        reason: 'shouldRethrow should be "false"',
      );
    });

    test(
        'Given `HandleError`<T>'
        'WHEN `handler(shouldRethrow:true)`  '
        'THEN returnedErrorHandler<T> report is `true`', () {
      void handler(AssertionError error) {}
      final withRethrow = handler.handler(shouldRethrow: true);
      expect(
        withRethrow.report,
        isFalse,
        reason: 'report should be "false"',
      );
      expect(
        withRethrow.shouldRethrow,
        isTrue,
        reason: 'shouldRethrow should be "true"',
      );
    });
  });
}
