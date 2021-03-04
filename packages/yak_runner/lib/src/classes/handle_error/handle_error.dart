import '../../all.dart';

/// this class defines how to handle a T that extends Error
class HandleError<T extends Error> extends HandleErrorBase<T> {
  /// it holds a `void Function(T)`
  final void Function(T)? handleError;

  /// constuctor has a single positinal argumeny
  HandleError([this.handleError]);

  /// the `call(T)` reflect the `handleError` Function
  @override
  void call(T error) => handleError?.call(error);

  /// create a `HandleError` that ignores the error,
  /// but the runner returns `Failure`
  factory HandleError.ignore() => HandleError();
}
