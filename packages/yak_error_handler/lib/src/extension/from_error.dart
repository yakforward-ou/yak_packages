import 'package:yak_error_handler/yak_error_handler.dart';

/// an extension to easily create an `ErrorHandler` from an `Error`
extension HandleErrorFromErrorX<T extends Error> on T {
  /// given a `void Function(Error)` return a ErrorHandler<T>
  ErrorHandler<T> handle(void Function(Error)? handleError) =>
      handleError != null ? ErrorHandler<T>(handleError) : ignore;

  /// ignore a given `Error`
  ErrorHandler<T> get ignore => ErrorHandler<T>((_) {});
}
