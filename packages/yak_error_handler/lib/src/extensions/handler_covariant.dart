import '../all.dart';

/// this extension allow using an `ErrorHandler` with T != Error in
/// ```dart
/// on Error catch (e) {}
/// ```
extension ErrorHandlerCovariantX<T extends Error> on ErrorHandler<T> {
  /// casts the ErrorHandler to `ErrorHandler<Error>`
  ErrorHandler get covariant => [this].first;
}
