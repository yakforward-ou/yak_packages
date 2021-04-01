import '../all.dart';

class Stub {
  late final StubMethod _stub;

  /// assign to the
  StubMethod unary<T, S>() => _stub = unaryStub<T, S>();

  // {
  //   _stub = unaryStub<T, S>();
  //   return _stub;
  // }

  StubMethod nullary<T>() {
    _stub = nullaryStub<T>();
    return _stub;
  }
}
