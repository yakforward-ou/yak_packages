import 'package:meta/meta.dart';
import 'all.dart';

/// an implementation of `StubResult` that holds an `Error`
class StubError<T> implements StubResult<T> {
  /// has an `Error` argument
  @internal
  final Error e;

  /// has a `const` constructor
  const StubError(this.e);

  @override
  T get result => throw e;
}
