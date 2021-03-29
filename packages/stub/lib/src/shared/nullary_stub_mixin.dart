import '../all.dart';

/// a mixin that implements `stub` getter and setter
mixin NullaryStubMixin<T> on StubBase {
  T Function() _stub = defaultStub<T>();

  /// returns a nullary stub
  T Function() get stub => () {
        callCount++;
        return _stub();
      };

  set stub(T Function() stub) => _stub = stub;
}
