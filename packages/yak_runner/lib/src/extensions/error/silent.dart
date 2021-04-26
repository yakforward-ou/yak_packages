import '../../../yak_runner.dart';

/// an extension to easily switch between ErrorHandler (class)
/// and HandleError(typedef) to avoid contravariance issues
extension ErrorHandlerSilentX<T extends Error> on T {
  /// returns an ErrorHandlerX
  ErrorHandler<T> get silent => ErrorHandler<T>((_) {});
}
