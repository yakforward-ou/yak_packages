import 'all.dart';

/// a class that returns either
abstract class StubResult<T> {
  /// wrap an `Error` allowing it to "flow" through the `stubbed` method
  const factory StubResult.error(Error err) = StubError;

  /// wrap an `Exception` allowing it to "flow" through the `stubbed` method
  const factory StubResult.exception(Exception exception) = StubException;

  /// a wrap a result `T`
  const factory StubResult.success(T result) = StubSuccess;

  /// either throws or return `T`
  T get result;
}
