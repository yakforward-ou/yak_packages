import '../stub.dart';

/// an extension that "wraps" a nullary `Stub`
/// it allows a correct behavior for Mocking classes
/// and when a method is `final`
extension WrapNullaryStubX<T> on Stub<T Function()> {
  /// wrap a `Stub` and returns the stubbed function
  T Function() get wrap => _WrapNullaryStub<T>(this);
}

/// a wrapper to allow stubbing method
/// in classes that hold stubbed functions as final
class _WrapNullaryStub<T> {
  final Stub<T Function()> _stub;
  _WrapNullaryStub(this._stub);
  T call() => _stub.stub();
}

/// an extension that "wraps" a unary `Stub`
/// it allows a correct behavior for Mocking classes
/// and when a method is `final`
extension WrapUnaryStubX<T, S> on Stub<T Function(S)> {
  /// wrap a `Stub` and returns the stubbed function
  T Function(S) get wrap => _WrapUnaryStub<T, S>(this);
}

/// a wrapper to allow stubbing method
/// in classes that hold stubbed functions as final
class _WrapUnaryStub<T, S> {
  final Stub<T Function(S)> _stub;
  _WrapUnaryStub(this._stub);
  T call(S arg) => _stub.stub(arg);
}
