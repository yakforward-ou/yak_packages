import '../../all.dart';

/// an extension to easily create an `HandleError` from an `Error`
extension HandleErrorFromErrorExtension<T extends Error> on T {
  /// given a `void Function(T)` return a HandleErrorBase<T>
  HandleErrorBase<T> handle(void Function(T) handleError) =>
      HandleError<T>(handleError);

  /// return a `HandleErrorBase<T>`
  HandleErrorBase<T> get ignore => HandleError<T>.ignore();
}
