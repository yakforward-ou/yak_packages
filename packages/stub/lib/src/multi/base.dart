import 'package:meta/meta.dart';

import '../all.dart';

/// an interface for `MultiStub`
abstract class MultiStubBase {
  /// a map for internal use
  @internal
  final map = <String, StubElement>{};

  /// returns a `StubElement`
  StubElement operator [](String name);

  /// initialize a `StubElement` of a given Type `T`
  /// and returns a  **type safe** `StubElement`
  StubElement<T> bind<T>(String name);
}
