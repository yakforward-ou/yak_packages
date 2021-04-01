import 'all.dart';

/// returns a NULLARY `stub`
///
/// to be replaced with `non-function type alias`
/// see [https://github.com/dart-lang/sdk/issues/44951]

StubMethod nullaryStub<T>() => _NullaryStub<T, T Function()>();

class _NullaryStub<T, Z extends T Function()> extends StubMethod<Z>
    with Counter<Z> {
  var _stub = (() => throw UnimplementedError()) as Z;
  @override
  Z get stub => _stub;
  @override
  set stub(Z fun) {
    _stub = () {
      increase();
      return fun();
    } as Z;
  }
}
