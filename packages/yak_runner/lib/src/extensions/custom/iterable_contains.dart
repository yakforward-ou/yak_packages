import '../../all.dart';

/// an extension on `Iterable` to easily access the result
extension YakRunnerIterableContainsExtension<T> on Iterable<T> {
  /// returns a `YakRunnerArg` from an Iterable
  Result<T> containsResult(T element) {
    final runner = IterableContains(this);
    return runner(element);
  }
}
