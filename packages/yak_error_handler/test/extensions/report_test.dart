import 'package:test/test.dart';
import 'package:yak_error_handler/yak_error_handler.dart';
// ignore_for_file: avoid_catching_errors

void main() {
  group('ErrorReportX test', () {
    test(
        'GIVEN `Error() `'
        'WHEN calling `report`'
        'THEN returns `ErrorReport`', () {
      ErrorReport? report;
      try {
        throw Error();
      } on Error catch (e) {
        report = e.report;
      }

      expect(
        report.report,
        isA<Error>(),
        reason: 'report message should be an `Error`',
      );
      expect(
        report.stackTrace,
        isA<StackTrace>(),
        reason: 'report stackTrace should be an `StackTrace`',
      );
    });
  });
}
