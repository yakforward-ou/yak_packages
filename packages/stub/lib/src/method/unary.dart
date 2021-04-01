import 'all.dart';

/// retun a UNARY `Stub`
StubMethod unaryStub<T, S>() => _Unary<T, S, T Function(S)>();

class _Unary<T, S, Z extends T Function(S)> extends StubMethod<Z>
    with Counter<Z> {
  Z _stub = ((_) => throw UnimplementedError()) as Z;
  @override
  Z get stub => _stub;
  @override
  set stub(Z fun) {
    _stub = (s) {
      increase();
      fun(s);
    } as Z;
  }
}
