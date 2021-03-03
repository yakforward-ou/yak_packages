import 'all.dart';

/// an implementation of `StubResult` that holds a result `T`
class StubSuccess<T> implements StubResult<T> {
  /// has an `Success` argument
  final T result;

  /// has a `const` constructor
  const StubSuccess(this.result);
}
