import 'package:meta/meta.dart';
import 'all.dart';

/// an implementation of `StubResult` that holds an `Exception`
class StubException<T> implements StubResult<T> {
  /// has an `Exception` argument
  @internal
  final Exception e;

  /// has a `const` constructor
  const StubException(this.e);

  @override
  T get result => throw e;
}
