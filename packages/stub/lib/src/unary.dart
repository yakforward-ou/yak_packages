import 'all.dart';
// ignore_for_file: invalid_use_of_internal_member

/// retun a UNARY `Stub`
///
/// to be replaced with `non-function type alias`
/// see [https://github.com/dart-lang/sdk/issues/44951]
Stub<T Function(S)> unaryStub<T, S>() => _UnaryStub<T, S, T Function(S)>();

/// an `UNARY` implementation of `StubMethod`
/// it's recommended to use  `nullaryStub<T>()`

class _UnaryStub<T, S, Z extends T Function(S)> extends Stub<Z>
    with Counter<Z> {
  Z? _stub;
  @override
  Z get stub => _stub ?? _default;
  @override
  set stub(Z fun) {
    _stub = (s) {
      increase();
      return fun(s);
    } as Z;
  }

  Z get _default {
    return ((_) {
      increase();
      throw UnimplementedError();
    }) as Z;
  }
}
