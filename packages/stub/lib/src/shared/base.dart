import 'package:meta/meta.dart';

/// an interface for `Stub` class
abstract class StubBase<T> {
  /// returns the number of times the stubbed function was called
  int get callCount;

  /// set the value of `stub`
  @internal
  set callCount(int i);

  /// returns the `stub` method for a function
  T Function() get stub;

  /// set the value of `stub`
  set stub(T Function() stub);

  /// set the `callCounts` to `0` and the stub to fallback
  void get reset;
}
