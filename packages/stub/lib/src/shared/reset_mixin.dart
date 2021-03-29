import '../all.dart';

/// a mixin that implements `reset` getter
mixin ResetStubMixin on StubBase {
  /// reset  the number of times the "stubbed" function has been called
  void get reset => callCount = 0;
}
