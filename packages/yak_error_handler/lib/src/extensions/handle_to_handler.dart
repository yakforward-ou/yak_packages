import '../all.dart';

/// an extension to easily switch between ErrorHandler (class)
/// and HandleError(typedef) to avoid contravariance issues
extension ErrorHandlerX<T extends Error> on HandleError<T> {
  /// returns an ErrorHandlerX
  ErrorHandler<T> handler({
    bool report = false,
    bool shouldRethrow = false,
  }) {
    return ErrorHandler(
      this,
      report: report,
      shouldRethrow: shouldRethrow,
    );
  }
}
