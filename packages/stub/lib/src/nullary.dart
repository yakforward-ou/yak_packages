import 'all.dart';
// ignore_for_file: invalid_use_of_internal_member

/// returns a NULLARY `stub`
///
/// to be replaced with `non-function type alias`
/// see [https://github.com/dart-lang/sdk/issues/44951]

Stub<T Function()> nullaryStub<T>() => _NullaryStub<T, T Function()>();

/// a `NULLARY` implementation of `StubMethod`
/// it's recommended to use  `nullaryStub<T>()`
class _NullaryStub<T, Z extends T Function()> extends Stub<Z> with Counter<Z> {
  Z? _stub;
  @override
  Z get stub {
    return _stub ?? _default;
  }

  @override
  set stub(Z fun) {
    _stub = () {
      increase();
      return fun();
    } as Z;
  }

  Z get _default {
    return (() {
      increase();
      throw UnimplementedError();
    }) as Z;
  }
}
