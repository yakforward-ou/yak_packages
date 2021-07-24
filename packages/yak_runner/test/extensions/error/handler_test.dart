import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

/// TODO replaced by yak_error_handler
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
        true,
        reason: 'report should be "true"',
      );
    });
  });
}
