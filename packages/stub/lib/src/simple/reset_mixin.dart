import 'all.dart';

/// a mixin that provides
mixin StubResetMixin<T> on StubBase<T> {
  /// reset  the number of times the "stubbed" function has been called

  void get reset {
    stub = defaultStub<T>();
    resetCallCount;
  }
}
