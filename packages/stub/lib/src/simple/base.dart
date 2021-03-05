import 'all.dart';

/// an interface for `Stub` class, implements `StubMixin` and `CallCounterMixin`
abstract class StubBase<T> implements CallCounterMixin {
  T Function() _stub;

  /// initialize `stub` with `defaultStub`
  StubBase() : _stub = defaultStub<T>();

  /// prvides a `stub` `T Function()`
  T Function() get stub => _stub;

  ///
  set stub(T Function() stub) {
    _stub = () {
      increaseCallCount;
      return stub();
    };
  }
}
