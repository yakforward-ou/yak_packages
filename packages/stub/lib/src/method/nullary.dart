import 'all.dart';

/// returns a NULLARY `stub`
StubMethod nullaryStub<T>() => _Nullary<T, T Function()>();

class _Nullary<T, Z extends T Function()> extends StubMethod<Z>
    with Counter<Z> {
  Z _stub = (() => throw UnimplementedError()) as Z;
  @override
  Z get stub => _stub;
  @override
  set stub(Z fun) {
    _stub = () {
      increase();
      fun();
    } as Z;
  }
}
