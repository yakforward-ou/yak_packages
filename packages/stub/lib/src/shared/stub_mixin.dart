import '../all.dart';

/// a mixin that implements `stub` getter and setter
mixin StubMixin<T> on StubBase<T> {
  T Function() _stub = defaultStub<T>();

  @override
  T Function() get stub => () {
        callCount++;
        return _stub();
      };

  @override
  set stub(T Function() stub) => _stub = stub;
}
