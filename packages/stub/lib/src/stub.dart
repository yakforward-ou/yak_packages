import 'package:meta/meta.dart';

import 'method/all.dart';

/// can be used both to extend a class that `implements` a mocked class
/// or "standalone" see the test for more details
///
class Stub {
  final _map = <String, StubMethod>{};

  /// returns a `StubElement`
  StubMethod operator [](String name) => _map.containsKey(name)
      ? _map[name]!
      : throw Exception('stub $name not found');

  /// initialize a `StubElement` of a given Type `T`
  @internal
  void nullary<T>(String name) =>
      _map.putIfAbsent(name, () => nullaryStub<T>());

  /// initialize a `StubElement` of a given Type `T`
  @internal
  void unary<T, S>(String name) =>
      _map.putIfAbsent(name, () => unaryStub<T, S>());

  /// resets all stub
  void get reset {
    for (final stub in _map.values) {
      stub.reset;
    }
  }
}
