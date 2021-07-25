import '../all.dart';

/// an extension on `Error`
extension ErrorReportX<T extends Error> on T {
  /// takes an Error `S` and returns `T?`
  /// calling `HandleError` if `Error` is of the correct Type
  ErrorReport get report {
    return ErrorReport(report: this, stackTrace: stackTrace);
  }
}
