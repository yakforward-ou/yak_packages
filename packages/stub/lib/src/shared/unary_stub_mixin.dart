import '../all.dart';

/// a mixin that implements `stub` getter and setter
mixin UnaryStubMixin<T, S> on StubBase {
  T Function(S) _stub = defaultUnaryStub<T, S>();

  /// returns a unary stub
  T Function(S) get stub => (s) {
        callCount++;
        return _stub(s);
      };

  set stub(T Function(S) stub) => _stub = stub;
}
