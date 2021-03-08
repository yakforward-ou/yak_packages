import 'package:meta/meta.dart';

import '../all.dart';

/// an interface for `MultiStub`
abstract class MultiStubBase<Z> {
  /// a map for internal use
  @internal
  final map = <String, StubElement>{};

  /// returns a `StubElement`
  StubElement operator [](String name);

  /// initialize a `StubElement` of a given Type `T`
  void bind<T>(String name);
}
