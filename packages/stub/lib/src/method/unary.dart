import 'all.dart';

/// retun a UNARY `Stub`
///
/// to be replaced with `non-function type alias`
/// see [https://github.com/dart-lang/sdk/issues/44951]

StubMethod unaryStub<T, S>() => _UnaryStub<T, S, T Function(S)>();

class _UnaryStub<T, S, Z extends T Function(S)> extends StubMethod<Z>
    with Counter<Z> {
  var _stub = ((s) => throw UnimplementedError()) as Z;
  @override
  Z get stub => _stub;
  @override
  set stub(Z fun) {
    _stub = (s) {
      increase();
      return fun(s);
    } as Z;
  }
}
