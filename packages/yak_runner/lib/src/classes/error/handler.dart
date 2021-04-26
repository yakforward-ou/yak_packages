import 'package:yak_error_handler/yak_error_handler.dart';

/// theis class circumvent the `contravariant` behavior of `HandleErrorX`
/// incapsulating it with `covariant` behavior
class ErrorHandler<T extends Error> {
  /// holds an HandleError
  final HandleError<T> _call;

  /// notifies the runner if the error must be notified
  final bool report;

  /// a simple constructor
  const ErrorHandler(this._call, {this.report = false});

  /// mirrors ` HandleErrorX` allowing a `covariant` of `T`
  T? call(covariant T error) {
    if (error is T) {
      _call(error);
      return error;
    }
  }
}
