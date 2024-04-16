import 'package:yak_utils/yak_utils.dart' show Nullary, NullaryDelegate;

import 'stub.dart';

/// a `NULLARY` implementation of `StubMethod`
class NullaryStub<T, Z extends Nullary<T>> extends Stub<Z> {
  Z? _stub;
  Z get _call => _stub ?? _default;
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

  @override
  T call() => _call();
}
