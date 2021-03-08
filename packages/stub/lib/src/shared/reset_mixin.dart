import '../all.dart';

/// a mixin that implements `reset` getter
mixin ResetStubMixin<T> on StubBase<T> {
  /// reset  the number of times the "stubbed" function has been called
  void get reset => callCount = 0;
}
