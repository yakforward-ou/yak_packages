import '../../stub.dart';

///
extension WrapNullaryStubX<T> on StubMethod<T Function()> {
  ///
  T Function() get wrap => WrapNullaryStub<T>(this);
}

/// a wrapper to allow stubbing method
/// in classes that hold stubbed functions as final
class WrapNullaryStub<T> {
  final StubMethod<T Function()> _stub;

  ///
  WrapNullaryStub(this._stub);

  ///
  T call() => _stub.stub();
}

///
extension WrapUnaryStubX<T, S> on StubMethod<T Function(S)> {
  ///
  T Function(S) get wrap => WrapUnaryStub<T, S>(this);
}

/// a wrapper to allow stubbing method
/// in classes that hold stubbed functions as final
class WrapUnaryStub<T, S> {
  final StubMethod<T Function(S)> _stub;

  ///
  WrapUnaryStub(this._stub);

  ///
  T call(S arg) => _stub.stub(arg);
}
