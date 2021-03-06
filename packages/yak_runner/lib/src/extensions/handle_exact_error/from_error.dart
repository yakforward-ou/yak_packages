import 'package:yak_error_handler/yak_error_handler.dart';

/// an extension to easily create an `HandleError` from an `Error`
extension HandleErrorFromErrorX<S extends Error> on S {
  /// given a `void Function(T)` return a HandleErrorBase<T>
  ErrorHandler<T, S> handle<T>(T? Function(Error) handleError) =>
      ErrorHandler<T, S>(handleError);
}
